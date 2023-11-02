const  express = require("express")

const app = express()

app.use(express.static('./product'))


app.listen(5000, ()=> {
    console.log('server is listing on port 5000....')
})