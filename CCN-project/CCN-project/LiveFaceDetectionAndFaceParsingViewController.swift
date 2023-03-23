import UIKit
import Vision

class LiveFaceDetectionAndFaceParsingViewController: UIViewController {

    @IBOutlet weak var cameraMetalVideoView: MetalVideoView?
    @IBOutlet weak var faceCropepdMetalView: MetalVideoView?
    @IBOutlet weak var faceParsedMetalView: MetalVideoView?
    
    var cameraTextureGenerater = CameraTextureGenerater()
    var croppedTextureGenerater = CroppedTextureGenerater()
    var multitargetSegmentationTextureGenerater = MultitargetSegmentationTextureGenerater()
    var overlayingTexturesGenerater = OverlayingTexturesGenerater()
    
    // MARK: - Vision Properties
    var segmentationRequest: VNCoreMLRequest?
    var visionModel: VNCoreMLModel?
    var detectionRequest: VNDetectFaceRectanglesRequest?
    
    // MARK: -
    var faceRectHistory: [CGRect] = []
    let maximumFaceRectNumber = 7 
    
    // MARK: - AV Properties
    var videoCapture: VideoCapture!
    
    @available(iOS 14.0, *)
    lazy var segmentationModel: FaceParsing = {
        let model = try! FaceParsing()
        return model
    }()
    let numberOfLabels = 19 
    
    var isInferencing = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // setup ml model
        setUpModel()
        
        // setup camera
        setUpCamera()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.videoCapture.start()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.videoCapture.stop()
    }
    
    // MARK: - Setup Core ML
    func setUpModel() {
        // face detector
        self.detectionRequest = VNDetectFaceRectanglesRequest()
        
        // face parsing semantic segmentation
        if #available(iOS 14.0, *) {
            if let visionModel = try? VNCoreMLModel(for: segmentationModel.model) {
                self.visionModel = visionModel
                segmentationRequest = VNCoreMLRequest(model: visionModel)
                segmentationRequest?.imageCropAndScaleOption = .centerCrop
            } else {
                fatalError()
            }
        } else {
            // Fallback on earlier versions
        }
    }
    
    // MARK: - Setup camera
    func setUpCamera() {
        videoCapture = VideoCapture()
        videoCapture.delegate = self
        videoCapture.fps = 50
        videoCapture.setUpCamera(sessionPreset: .vga640x480, position: .front) { (success) in
            if success {
                // 초기설정이 끝나면 라이브 비디오를 시작할 수 있음
                self.videoCapture.start()
            }
        }
    }
}

// MARK: - VideoCaptureDelegate
extension LiveFaceDetectionAndFaceParsingViewController: VideoCaptureDelegate {
    func videoCapture(_ capture: VideoCapture, didCaptureVideoSampleBuffer sampleBuffer: CMSampleBuffer) {
        
        guard let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }
        if !isInferencing {
            // predict!
            predict(with: pixelBuffer)
        }
    }
}

// MARK: - Inference
extension LiveFaceDetectionAndFaceParsingViewController {
    // prediction
    func predict(with pixelBuffer: CVPixelBuffer) {
        // ==================================================
        // 1. rendering camera frame
        // ==================================================
       guard let cameraTexture = cameraTextureGenerater.texture(from: pixelBuffer) else { return }
        cameraMetalVideoView?.currentTexture = cameraTexture
        
        guard !isInferencing else { return }
        isInferencing = true
        
        // ==================================================
        // 2. face detection and rendering cropped face frame
        // ==================================================
        
        
        // ==================================================
        // 3. face-parsing semantic segemtation and rendering it
        // ==================================================
        
    }
    func convertBoundingBoxForTexture(rect: CGRect, width: CGFloat, height: CGFloat) -> CGRect {
        let transform = CGAffineTransform(scaleX: 1, y: -1).translatedBy(x: 0, y: -1)
        let translate = CGAffineTransform.identity.scaledBy(x: width, y: height)
        return rect.applying(transform).applying(translate)
    }
}

