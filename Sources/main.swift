import Blackfish
import BlackfishStencil

let app = Blackfish()

app.use(renderer: StencilRenderer(), ext: ".stencil")

app.get("/test") { request, response in
    response.send(text: "Hello world")
}

app.get("/") { request, response in
    response.render("welcome.stencil", data: ["Title": "Blackfish"])
}

app.listen(port: 4000) { error in
    if error == nil {
        print("App listening on port 4000")
    } else {
        print(error)
    }
}
