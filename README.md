# Магазин

## Описание

Консольное приложение, имитирующее покупку товаров.

Программа написана на [Ruby](https://www.ruby-lang.org/ru/).

## Использование

Для запуска программы потребуется [установка](https://www.ruby-lang.org/ru/documentation/installation/) Ruby.

Склонируйте репозиторий:

```
git clone https://github.com/zorkostreis/store.git
```
Перейдите в папку `store`

```
cd store
```

Запустите программу:

```
ruby main.rb
```

Выбирайте среди предложенных товаров:

```
Добро пожаловать в наш магазин!

Что хотите купить?

1. Фильм «Леон», 1994, режиссёр - Люк Бессон, 990 руб. (осталось 5)
2. Фильм «Дурак», 2014, режиссёр - Юрий Быков, 890 руб. (осталось 3)
3. Книга «Идиот», роман, автор - Фёдор Достоевский, 1590 руб. (осталось 4)
4. Книга «Преступление и наказание», роман, автор - Фёдор Достоевский, 1230 руб. (осталось 4)
5. Альбом Mac Miller - «Circles», Хип-хоп, 2020, 1150 руб. (осталось 3)
6. Альбом Lana Del Rey - «Norman Fucking Rockwell!», Поп-музыка, 2019, 1350 руб. (осталось 2)
0. Выход

Введите число:
```

По окончанию сеанса программа сообщит информацию о купленных товарах:

```
Вы купили:
Фильм «Леон», 1994, режиссёр - Люк Бессон, 990 руб. (осталось 4): 1 шт.
Книга «Преступление и наказание», роман, автор - Фёдор Достоевский, 1230 руб. (осталось 2): 2 шт.
Альбом Mac Miller - «Circles», Хип-хоп, 2020, 1150 руб. (осталось 2): 1 шт.

С Вас — 4600 руб. Спасибо за покупку!
```

## Добавление новых товаров

Для добавления новых товаров перейдите в нужную категорию в папке `data`.

Создайте там новый файл с расширением `.txt` и напишите там информацию про ваш товар.

Пример для диска:

```
Circles
Mac Miller
Хип-хоп
2020
1150
3

```
