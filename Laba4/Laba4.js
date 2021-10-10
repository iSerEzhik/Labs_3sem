const productTable = document.getElementById('products');
const cartTable = document.getElementById('cart');
const inputProductName = document.getElementById('ProductName');
const inputProductPrice = document.getElementById('ProductPrice');
const inputProductCount = document.getElementById('ProductCount');
const productsInShop = new Map();
const productsInACart = new Map();

function createRowWithBtn(productsMap, productName, productPrice, productCount) {
    let row = createRowWithoutBtn(productsMap, productName, productPrice, productCount);
    row.append(createAddToCartBtn());
    return row;
}

function createRowWithoutBtn(productsMap, productName, productPrice, productCount) {
    productsMap.set(productName, productCount);
    let row = document.createElement('div');
    row.setAttribute('class', 'row');
    let name = document.createElement('div');
    name.innerText = productName;
    name.setAttribute('class', 'name');
    let price = document.createElement('div');
    price.innerText = productPrice;
    price.setAttribute('class', 'price');
    let count = document.createElement('div');
    count.setAttribute('class', 'count');
    count.innerText = productCount;
    row.append(name, price, count);
    return row;
}

function createAddToCartBtn() {
    let buyDiv = document.createElement('div');
    buyDiv.setAttribute('class', 'buy');
    let inputBuyCount = document.createElement('input');
    inputBuyCount.setAttribute('type', 'number');
    inputBuyCount.setAttribute('name', 'BuyCount');
    inputBuyCount.setAttribute('id', 'BuyCount');
    inputBuyCount.setAttribute('value', 1);
    inputBuyCount.setAttribute('min', 1);
    let addToCart = document.createElement('button');
    addToCart.setAttribute('class', 'addToCart');
    addToCart.setAttribute('onclick', 'addToCart(this.parentElement.parentElement);document.getElementById(\'result\').innerText=""');
    buyDiv.append(inputBuyCount, addToCart);
    return buyDiv;
}

function getTableRows(table) {
    return Array.from(table.children).filter((elem) => elem.getAttribute('class')?.includes('row') && !elem?.id.includes('header'));
}

function getDataAndClear(element) {
    let data = element.value;
    clear(element);
    return data;
}

function clear(elem) {
    elem.value = '';
}

function printFullPrice() {
    let sum = 0;
    getTableRows(cartTable).forEach((row) => {
        sum += +row.querySelector('.price').innerText * row.querySelector('.count').innerText;
    });
    document.getElementById('result').innerText = `Сумма покупок ${sum}`;
}

function addToCart(row) {
    let rowCount = +row.querySelector('#BuyCount').value;
    if (rowCount < 1) {
        alert('Введите кол-во больше 0');
        row.querySelector('#BuyCount').value = 1;
        return;
    }
    let rowName = row.querySelector('.name').innerText;
    if (productsInShop.get(rowName) - rowCount < 0) {
        alert('На складе не хватает товара');
        return;
    }
    if (productsInACart.has(row.querySelector('.name').innerText)) {
        let countInTable = getTableRows(cartTable)
            .find((elem) => elem.querySelector('.name').innerText == rowName)
            .querySelector('.count');
        countInTable.innerText = +countInTable.innerText + rowCount;
        productsInACart.set(rowName, productsInACart.get(rowName) + rowCount);
    } else {
        cartTable.append(createRowWithoutBtn(productsInACart, rowName, row.querySelector('.price').innerText, rowCount));
    }
    getTableRows(productTable)
        .find((tableRow) => tableRow == row)
        .querySelector('.count').innerText -= rowCount;
    productsInShop.set(rowName, productsInShop.get(rowName) - rowCount);
}

function addRowToShop() {
    let name = getDataAndClear(inputProductName);
    let count = +getDataAndClear(inputProductCount);
    let price = +getDataAndClear(inputProductPrice);
    console.log(name, count, price);
    if (count < 0 || price < 0 || !count || !price || !name) {
        alert('Все поля должны быть заполнены, цена и колличество должны быть больше 0');
        return;
    }
    if (productsInShop.has(name)) {
        let countInRow = getTableRows(productTable)
            .find((elem) => elem.querySelector('.name').innerText == name)
            .querySelector('.count');
        countInRow.innerText = count + productsInShop.get(name);
        productsInShop.set(name, +countInRow.innerText);
    } else {
        productTable.append(createRowWithBtn(productsInShop, name, price, count));
    }
}

//Начальный список продуктов
productTable.append(createRowWithBtn(productsInShop, 'Колбаса', 200, 15));
productTable.append(createRowWithBtn(productsInShop, 'Кабачок', 50, 10));
productTable.append(createRowWithBtn(productsInShop, 'Молоко', 75, 5));
