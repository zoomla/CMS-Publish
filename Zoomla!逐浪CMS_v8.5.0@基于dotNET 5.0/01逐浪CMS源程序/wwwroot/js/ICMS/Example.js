/*
function test() {
    return new Promise((resolve) => {
        $.post("/API/Content?action=node_list", {}, function (data) {
            resolve(data);
        });
    });
    //var num = 1;
    //return new Promise((resolve, reject) => {
    //    setTimeout(() => { num > 0.5 ? resolve(num) : reject(num); }, 1000);
    //});

}
//function test() {return $.when("info"); }
test().then(function (data) { console.log("a1", data); return "123123"; }).then(function (data) { console.log("a2", data); });
$.post("/API/Content?action=node_list").then(function (data) { console.log("a2", data); return "123123"; }).then(function (data) { console.log("a3", data); });
*/