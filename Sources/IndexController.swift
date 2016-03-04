import Blackfish

class IndexController: Controller {
    
    func routes(router: Router) {
        router.get("/", handler: index)
        router.get("/test", handler: test)
    }

    func index(request: Request, response: Response) {
        response.render("welcome.stencil")
    }

    func test(request: Request, response: Response) {
        response.render("test.stencil", data: ["names": [["first": "John", "last": "Smith"], ["first": "Alec", "last": "Baldwin"]]])
    }
}
