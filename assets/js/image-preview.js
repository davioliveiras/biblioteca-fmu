

"https://m.media-amazon.com/images/I/819js3EQwbL._AC_UF1000,1000_QL80_.jpg"

var inputElement = document.getElementById("inputGroupFile01")
inputElement.addEventListener("change", getUpload)

function getUpload(){
    let previewShow = document.getElementById("photo-preview-show")
    let previewInput = document.getElementById("photo-preview-input")

    const myUrl = URL.createObjectURL(inputElement.files[0])
    
    previewShow.src = myUrl
    previewInput.style.display = "none"
    previewShow.style.display = "block"
    console.log(inputElement.files[0])
}

function saveImage(){
    let submit = document.getElementById("form")

    console.log("ei")
    submit.addEventListener("", (event) => {
        event.preventDefault()
        console.log("ei")
    })
}