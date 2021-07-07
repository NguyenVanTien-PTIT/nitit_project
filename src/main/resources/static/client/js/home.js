$(document).ready(function() {
    //Thêm vào giỏ hàng
    $(".add-to-cart").on("click", function () {
        var dataCart = {};
        var idWatch = $(this).attr("watchId");
        dataCart.idWatch = idWatch;

        NProgress.start();
        var url = "/client/cart";

        $.ajax ({
            url: url,
            type: "POST",
            data: JSON.stringify(dataCart),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function(res){
                NProgress.done();
                if(res.httpStatus === 'OK') {
                    toastr.success(res.msg);
                } else  if(res.httpStatus === 'FORBIDDEN'){
                    swal(
                        'Lỗi!',
                        res.msg,
                        'error'
                    ).then(function() {
                        location.replace("/login");
                    });
                }
            },
            error: function (error) {
                swal(
                    'Thông báo',
                    'Bạn chưa đăng nhập',
                    'warning'
                ).then(function() {
                    location.replace("/login");
                });
            }
        });
    });

    //Thêm vào wishlist
    $('.add-to-wishlist').on('click', function (){
        var idWatch = $(this).attr("watchId");
        var url = "/client/wishlist/"+ idWatch;
        $.ajax ({
            url: url,
            type: "POST",
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function(res){
                // NProgress.done();
                if(res.httpStatus === 'OK') {
                    toastr.success(res.msg);
                } else  if(res.httpStatus === 'FORBIDDEN'){
                    swal(
                        'Lỗi!',
                        res.msg,
                        'error'
                    ).then(function() {
                        location.replace("/login");
                    });
                }else if(res.httpStatus === 'BAD_REQUEST'){
                    swal(
                        'Thông báo!',
                        res.msg,
                        'info'
                    )
                }
            },
            error: function (error) {
                swal(
                    'Thông báo',
                    'Bạn chưa đăng nhập',
                    'warning'
                ).then(function() {
                    location.replace("/login");
                });
            }
        });
    });
});
