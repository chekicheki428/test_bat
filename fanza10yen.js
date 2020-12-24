// ==UserScript==
// @name         fanza 10yen
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  shiko!
// @author       chekicheki428
// @match        https://www.dmm.co.jp/dc/doujin/-/list/=/article=keyword/id=300249/limit=30/*
// @grant        none
// ==/UserScript==
(function () {
    'use strict';

    setTimeout(console.log("start") ,3000);

    var buttons = document.getElementsByClassName('tileListPurchaseStatus__btn--addToBasket');

    var count = 0;
    buttons.forEach(element => {
        console.log(element);
        element.click();
        console.log("count :" + ++count);
    });
})();