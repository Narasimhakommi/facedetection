import CoreGraphics
import Metal

public let sharedMetalRenderingDevice = MetalRenderingDevice()

public class MetalRenderingDevice {
    public let device: MTLDevice
    public let commandQueue: MTLCommandQueue

    init() {
        guard let device = MTLCreateSystemDefaultDevice() else { fatalError("Could not create Metal Device") }
        self.device = device

        guard let queue = self.device.makeCommandQueue() else { fatalError("Could not create command queue") }
        self.commandQueue = queue
    }

    func generateRenderPipelineDescriptor(vertexFuncName: String, fragmentFuncName: String, colorPixelFormat: MTLPixelFormat = .bgra8Unorm) throws -> MTLRenderPipelineDescriptor {
        let framework = Bundle.main
        let resource = framework.path(forResource: "default", ofType: "metallib")!
        let library = try self.device.makeLibrary(filepath: resource)

        let vertex_func = library.makeFunction(name: vertexFuncName)
        let fragment_func = library.makeFunction(name: fragmentFuncName)
        let rpd = MTLRenderPipelineDescriptor()
        rpd.vertexFunction = vertex_func
        rpd.fragmentFunction = fragment_func
        rpd.colorAttachments[0].pixelFormat = colorPixelFormat

        return rpd
    }

    func makeRenderVertexBuffer(origin: CGPoint = .zero, size: CGSize) -> MTLBuffer? {
        let w = size.width, h = size.height
        let vertices = [
            Vertex(position: CGPoint(x: origin.x , y: origin.y), textCoord: CGPoint(x: 0, y: 0)),
            Vertex(position: CGPoint(x: origin.x + w , y: origin.y), textCoord: CGPoint(x: 1, y: 0)),
            Vertex(position: CGPoint(x: origin.x + 0 , y: origin.y + h), textCoord: CGPoint(x: 0, y: 1)),
            Vertex(position: CGPoint(x: origin.x + w , y: origin.y + h), textCoord: CGPoint(x: 1, y: 1)),
        ]
        return makeRenderVertexBuffer(vertices: vertices)
    }

    func makeRenderVertexBuffer(vertices: [Vertex]) -> MTLBuffer? {
        return self.device.makeBuffer(bytes: vertices, length: MemoryLayout<Vertex>.stride * vertices.count, options: .cpuCacheModeWriteCombined)
    }

    func makeRenderUniformBuffer(size: CGSize) -> MTLBuffer? {
        let matrix = Matrix.identity
        matrix.scaling(x: 2 / Float(size.width), y: -2 / Float(size.height), z: 1)
        matrix.translation(x: -1, y: 1, z: 0)
        return self.device.makeBuffer(bytes: matrix.m, length: MemoryLayout<Float>.size * 16, options: [])
    }
    
    func makeRenderTexture(pixelFormat: MTLPixelFormat, width: Int, height: Int) -> MTLTexture? {
        let textureDescriptor = MTLTextureDescriptor.texture2DDescriptor(pixelFormat: pixelFormat, width: width, height: height, mipmapped: false)
        textureDescriptor.usage = [.shaderRead, .renderTarget]
        return self.device.makeTexture(descriptor: textureDescriptor)
    }
}
