function show_result(data) {
    var result = document.getElementById("result");
    console.log(data.value)
    result.innerHTML = "<hr/>Result is: <p id='num'>" + data.value +
        "</p><hr/><p>" + Date() + "</p>";
}

jQuery(function ($) {
        $(document).ready(function () {

            $('#submit').click(function (){
                console.log(document.querySelector('#v1').value);
                $.ajax({
                    url:`/laba8/view.json?v1=${document.querySelector('#v1').value
                    }&commit=Send`,
                    type:'get',
                    dataType:'json',
                    success: function (response){
                        show_result(response)
                    }
                })
            })

        });
    }
)