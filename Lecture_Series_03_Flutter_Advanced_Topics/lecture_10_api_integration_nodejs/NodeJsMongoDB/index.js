const express = require("express");
const mongoose = require("mongoose");


const app = express();



app.use(express.json());



app.use(express.urlencoded({ extended: true }));





const userdata = [];
// const mongoURI = "mongodb+srv://SMAS:123@cluster0.mongodb.net/myDatabase?retryWrites=true&w=majority";

// mongoose.connect(mongoURI, {
//     useNewUrlParser: true,
//     useUnifiedTopology: true
// }).then(() => console.log("MongoDB Connected"))
//   .catch(err => console.error("MongoDB Connection Failed:", err));

// mongodb+srv://smarsalanshah125:<db_password>@cluster0.t47nn.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0

mongoose.connect("mongodb+srv://SMAS:123@cluster0.t47nn.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0").then(() => console.log("MongoDB Connected"))
.catch(err => console.error("MongoDB Connection Failed:", err));






// **********************postapi **************



app.post("/api/add_infouser", (req, res) => {

    console.log("result ", req.body);


    const uData = {
        "id": userdata.length + 1,
        "email": req.body.email,
        "pass": req.body.pass
    }

    userdata.push(uData);

    console.log("Final", uData);



    res.status(200).send({
        "statuscode": 200,
        "message": "account successfully created",
        "userdata": uData
    });
});




app.get("/api/get_infouser", (req, res) => {


    if (userdata.length > 0) {
        res.status(200).send({
            "statuscode": 200,
            "userdata": userdata
        });
    } else {

        res.status(200).send({
            "statuscode": 200,
            "userdata": []
        });
    }

});


app.post("/api/update_infouser/:id", (req, res) => {
    let id = req.params.id * 1;
    let userdataToUpdate = userdata.find(p => p.id === id);
    let index = userdata.indexOf(userdataToUpdate);
    userdata[index] = req.body;
    res.status(200).send({
        "status": "success",
        "message": " successfully updated",
    })
});


app.post("/api/delete_infouser/:id", (req, res) => {
    let id = req.params.id * 1;
    let userdataToUpdate = userdata.find(p => p.id === id);
    let index = userdata.indexOf(userdataToUpdate);
    userdata.splice(index, 1);
    res.status(200).send({
        "status": "success",
        "message": " successfully deleted",
    })

});

app.listen(2000, () => {

    console.log("connected to server at 2000")



})