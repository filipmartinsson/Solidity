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

    function getBalance() {
        instance.getBalance(function (error, result) {
            if(error){
              alert(error);
            }
            else{
              $("#balance").html(result.toString());
            }
        });
    }

    function waitForReceipt(txHash, cb){
      web3.eth.getTransactionReceipt(txHash, function(error, receipt){
        if(error){
          alert(error);
        }
        else if(receipt !== null){
          cb(receipt);
        }
        else{
          window.setTimeout(function(){
            waitForReceipt(txHash, cb);
          }, 5000);
        }
      })
    }

    function flip(){
      let val = parseInt($("#bet").val());
      instance.flip.sendTransaction({from: "ADDRESS", gas:100000, value: val}, function(error, txHash){
        if(error){
          alert(error);
        }
        else{
            waitForReceipt(txHash, function(receipt){
              if(receipt.status === "0x1"){
                alert(JSON.stringify(receipt));
              }
              else{
                alert("receipt status fail");
              }
            });
        }
      })
    }

    $(document).ready(function () {
          init(function () {
              getBalance();
          });
          $("#submit").click(function(){
            flip();
          })
      });
})(Contracts['Coinflip']);
