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
      });
})(Contracts['HelloWorld']);
