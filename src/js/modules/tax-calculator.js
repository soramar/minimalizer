export default function taxCalculator(price ,tax) {
  return Math.round(price * (1 + tax));
}