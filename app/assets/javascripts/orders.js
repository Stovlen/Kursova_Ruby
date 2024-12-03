// document.addEventListener("DOMContentLoaded", () => {
//   const citySelect = document.getElementById("city-select");
//   const branchSelect = document.getElementById("branch-select");

//   citySelect.addEventListener("change", () => {
//     const city = citySelect.value;

//     if (city) {
//       fetch(`/orders/branches?city=${city}`)
//         .then((response) => response.json())
//         .then((branches) => {
//           branchSelect.innerHTML = '<option value="">Оберіть відділення</option>';
//           branches.forEach((branch) => {
//             const option = document.createElement("option");
//             option.value = branch;
//             option.textContent = branch;
//             branchSelect.appendChild(option);
//           });
//         });
//     }
//   });
// });
