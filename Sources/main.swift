import Blackfish
import BlackfishStencil

let app = Blackfish()

app.use(renderer: StencilRenderer(), ext: ".stencil")
app.use(path: "/", controller: IndexController())

app.listen(port: 4000) { error in
    if error == nil {
        print("App listening on port \(app.port)")
    } else {
        print(error)
    }
}
