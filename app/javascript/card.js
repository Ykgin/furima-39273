const pay = () => {
  const payjp = Payjp(process.env.PAYJP_PUBLIC_KEY);
  const elements = payjp.elements();
  const numberElement = elements.create('cardNumber');
  const expiryElemnt = elements.create('cardExpiry');
  const cvcElement = elements.create('cardCvc');

  numberElement.mount('#number-form');
  expiryElemnt.mount('#expiry-form')
  cvcElement.mount('#cvc-form');

  const submit = document.getElementById("button");
  
  submit.addEventListener("click", (e) => {
    e.preventDefault();
    payjp.createToken(numberElement).then(function(response) {
      if (response.error) {
      } else {
      const token = response.id;
      console.log(token)
      const renderDom = document.getElementById("charge-form");
      const tokenObj = `<input value=${token} name='token' type="hidden">`;
      renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
      numberElement.clear();
      expiryElemnt.clear();
      cvcElement.clear();
      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);