const productTable = document.getElementById("products");
const cartTable = document.getElementById("cart");
const inputProductName = document.getElementById("ProductName");
const inputProductPrice = document.getElementById("ProductPrice");

function createRowWithBtn(productName, productPrice) {
  let row = createRowWithoutBtn(productName, productPrice);
  row.append(createAddToCartBtn());
  return row;
}

function createRowWithoutBtn(productName, productPrice) {
  let row = document.createElement("div");
  row.setAttribute("class", "row");
  let name = document.createElement("div");
  name.innerText = productName;
  let price = document.createElement("div");
  price.innerText = productPrice;
  price.setAttribute("class", "price");
  row.append(name, price);
  return row;
}

function createAddToCartBtn() {
  let addToCart = document.createElement("button");
  addToCart.setAttribute("class", "addToCart");
  addToCart.setAttribute(
    "onclick",
    "addToCart(this.parentElement);document.getElementById('result').innerText=\"\""
  );
  return addToCart;
}
function addToCart(row) {
  cartTable.append(
    createRowWithoutBtn(
      row.firstElementChild.innerText,
      row.children.namedItem("price").innerText
    )
  );
}

function getTableRows(table) {
  return Array.from(table.children).filter(
    (elem) =>
      elem.getAttribute("class")?.includes("row") &&
      !elem?.id.includes("header")
  );
}
function getDataAndClear(element) {
  let data = element.value;
  if (!data) {
    alert("Field can't be empty");
    return;
  }
  element.value = "";
  return data;
}

function printFullPrice() {
  let sum = 0;
  getTableRows(cartTable).forEach((element) => {
    sum += parseInt(element.lastElementChild.innerText);
  });
  document.getElementById("result").innerText = `Сумма покупок ${sum}`;
}

//Начальный список продуктов
productTable.append(createRowWithBtn("Колбаса", 200));
productTable.append(createRowWithBtn("Кабачок", 50));
productTable.append(createRowWithBtn("Молоко", 75));
