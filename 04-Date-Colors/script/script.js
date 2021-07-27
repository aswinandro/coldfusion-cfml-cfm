var x= document.getElementById("status");

// x.innerHTML= "Simple Check"

function validate(){
    console.log("Welcomeeeee")
    if (document.getElementById("textin").value == "" ){
        alert("Type in Something and Submit")
    }
    else if (document.getElementById("textin").value > 5 ){
        alert("Enter a Value below 5 ")
    }
    else if (document.getElementById("textin").value > isNaN ){
        alert("Enter a Number")
    }
}
