(function (Contract) {
    var web3;
    var instance;

    function init(cb) {
        web3 = new Web3(
            (window.web3 && window.web3.currentProvider) ||
            new Web3.providers.HttpProvider(Contract.endpoint));

        var contract_interface = web3.eth.contract(Contract.abi);
        instance = contract_interface.at(Contract.address);
        cb();
    }

    function getMessage(cb) {
        console.log("getmessage!!!");
        instance.message(function (error, result) {
            cb(error, result);
        });
    }

    function refreshMessage(error, result){
        console.log("refresh: " + result);
        if (error) {
            console.error("Could not get article:", error);
            return;
        }
        $('#message').html(result);
    }

    function updateMessage() {
        console.log("update message start");
        let newMessage = $('#message-input').val();
         console.log(newMessage + "11111");
        if(newMessage && newMessage.length > 0){
            instance.update.sendTransaction(newMessage, {from: "0xa48f2e0be8ab5a04a5eb1f86ead1923f03a207fd", gas: 30000000}, function(error, result){
                if(error){
                    console.log("could not write transaction:", error);
                    return;
                }
                console.log("DOOONE");
                //Filter konstigt felmeddelande. KOlla med tomas kanske.
                setTimeout(function() {
                    getMessage(refreshMessage);
                }, 1000);

            });
        }
        else{
            console.log("empty string input")
            return;
        }
    }

    $(document).ready(function () {
        init(function () {
            getMessage(refreshMessage);
        });
        $('#submitButton').click(function(){
            updateMessage();
        });
    });
})(Contracts['HelloWorld']);
