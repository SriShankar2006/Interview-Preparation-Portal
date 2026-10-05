(function () {
    "use strict";

    var form = document.getElementById("registrationForm");
    var message = document.getElementById("message");
    var phpValidatorUrl = "http://localhost:8000/validate_registration.php";

    form.addEventListener("submit", function (event) {
        event.preventDefault();
        message.className = "";
        message.textContent = "Checking registration...";

        var xhr = new XMLHttpRequest();
        xhr.open("POST", phpValidatorUrl, true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function () {
            if (xhr.readyState !== XMLHttpRequest.DONE) return;
            if (xhr.status !== 200 || !xhr.responseXML) {
                message.className = "error";
                message.textContent = "PHP validation service is unavailable.";
                return;
            }

            var status = xhr.responseXML.getElementsByTagName("status")[0];
            var responseMessage = xhr.responseXML.getElementsByTagName("message")[0];
            if (!status || !responseMessage) {
                message.className = "error";
                message.textContent = "Invalid response from PHP validation service.";
                return;
            }

            if (status.textContent === "valid") {
                form.submit();
            } else {
                message.className = "error";
                message.textContent = responseMessage.textContent;
            }
        };

        var fields = ["userName", "userEmail", "password", "confirmPassword", "terms"];
        var values = [];
        fields.forEach(function (field) {
            var element = document.getElementById(field);
            values.push(encodeURIComponent(field) + "=" + encodeURIComponent(element.type === "checkbox" ? (element.checked ? element.value : "") : element.value));
        });
        xhr.send(values.join("&"));
    });
}());
