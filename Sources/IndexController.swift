import Blackfish

class IndexController: Controller {
    
    func routes(router: Router) {
        router.get("/", handler: index);
    }

    func index(request: Request, response: Response) {
        response.render("welcome.stencil")
    }
}
