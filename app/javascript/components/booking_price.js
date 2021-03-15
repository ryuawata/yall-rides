
// TODO: how to get the price of the car?
  // => the price of the car needs to be embedded in the HTML view
  // => in the HTML: id='car-price' data-price='<%= @car.price %>'

const numberWithCommas = (num) => {
  return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}
const priceInsertHTML = (totalPrice) => {
  const formattedPrice = numberWithCommas(totalPrice)
  console.log(formattedPrice)
  // TODO: Decide where you want to place the formattedPrice
     // for now, i'll place it in above the booking submit btn
  const totalPriceElement = document.querySelector('#form-total-price')
  console.log(totalPriceElement)
  totalPriceElement.innerText = `¥${formattedPrice}`
}
const priceCalcuation = () => {
  const priceElement = document.getElementById('car-price')
  const startDateInput = document.getElementById('booking_start_date')
  const endDateInput = document.getElementById('booking_end_date')
  console.log('event trigger')
  if (startDateInput.value !== '' && endDateInput.value !== '') {
    // convert strings into actual dates
    const endDate = new Date(endDateInput.value)
    const startDate = new Date(startDateInput.value)
    console.log(endDate)
    console.log(startDate)
    // convert the difference into days
    let numDays = Math.round((endDate - startDate) / ( 1000 * 60 * 60 * 24))
    // only do the calculation if the user gives a proper range of dates
    if (numDays >= 0) {
      // instead of getting difference of days it's counting each day
      numDays += 1
      // convert it into an integer
      const price = Number.parseInt(priceElement.dataset.price, 10);
      console.log(price)
      // format and insert into HTML
      priceInsertHTML(numDays * price)
    }
  }
}
const bookingPriceUpdate = () => {
  const startDateInput = document.getElementById('booking_start_date')
  const endDateInput = document.getElementById('booking_end_date')
  if (startDateInput && endDateInput) {
    startDateInput.addEventListener('change', (event) => {
      priceCalcuation(event)
    });
    endDateInput.addEventListener('change', (event) => {
      priceCalcuation(event)
    })
  }
}
export { bookingPriceUpdate };
