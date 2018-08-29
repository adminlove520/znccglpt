$(".addbtn").click(function () {

    // var file = $("#file")[0].files[0];
    // var id = $("#id").val();
    // var formData  = new FormData();
    // formData .append("fileinfo", file);
    // formData .append("id", id);
    // console.log(formData .get("fileinfo"));
    // console.log(formData .get("id"));


    var formData = new FormData($("#upload")[0]);

    $.ajax({
        type: "post",
        url: "/ssm/testUpload",
        data: formData ,
        async: false,
        cache: false,
        contentType: false,
        processData: false,
        success: function (data) {
            console.log("success");
            console.log(data);
        },
        error: function (data) {
            console.log("error");
            console.log(data);
        }
    });
});