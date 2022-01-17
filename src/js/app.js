import addCalculator from './modules/add-calculator';
import taxCalculator from './modules/tax-calculator';

var item1_price = 100;
var item2_price = 300;
var total_price = addCalculator(item1_price, item2_price);
var tax = 0.1;
var tax_price = taxCalculator(total_price, tax);

window.onload = function() {
    document.getElementById('calculate-result').innerHTML = tax_price;
};