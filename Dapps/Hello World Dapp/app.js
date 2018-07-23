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
        instance.message(function (error, result) {
            cb(error, result);
        });
    }

    function updateMessage() {
        let newMessage = $('#message-input').val();
        if(newMessage && newMessage.length > 0){
            instance.update.sendTransaction(newMessage, {from: "0xa48f2e0be8ab5a04a5eb1f86ead1923f03a207fd", gas: 30000000}, function(error, result){
                if(error){
                    console.log("error in sendTransaction");
                }
                else{
                    setTimeout(function(){
                      getMessage(function(error, result){
                        if(error){
                          console.error("Could not get artice:", error);
                          return;
                        }
                        $('#message').html(result);
                      });
                    }, 1000)
                }
            });
        }
        else{
            alert("Newmessage not defined");
        }
    }

    $(document).ready(function () {
          init(function () {
              getMessage(function (error, result) {
                  if (error) {
                      console.error("Could not get article:", error);
                      return;
                  }
                  $('#message').append(result);
              });
          });
          $(’#submitButton’).click(function() {
              updateMessage();
          });
      });
})(Contracts['HelloWorld']);
