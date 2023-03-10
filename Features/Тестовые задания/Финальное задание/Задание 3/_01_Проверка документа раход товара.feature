#language: ru
@РасходТовара
@tree

Функционал: Проверка документа раход товара

Как тестировщик я хочу
проверить функционал документ раход товара  

Контекст:
	Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: Создание документа
* Открытие формы создания документа
	И я закрываю все окна клиентского приложения
	И В командном интерфейсе я выбираю 'Продажи' 'Продажи'
	Тогда открылось окно 'Продажи товара'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно 'Продажа товара (создание)'
* Заполнение реквизитов шапки
	И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "Все для дома"'
	И из выпадающего списка с именем "Склад" я выбираю точное значение 'Малый'
	И я нажимаю кнопку выбора у поля с именем "Покупатель"
	Тогда открылось окно 'Контрагенты'
	И я нажимаю на кнопку с именем 'ФормаСписок'
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование' |
		| '000000011' | 'ЭлектроБыт ЗАО'  |
	И я нажимаю на кнопку с именем 'ФормаВыбрать'
	И из выпадающего списка с именем "Валюта" я выбираю точное значение 'Рубли'	
* Проверим заполнение поля Вид цен
	Если элемент формы с именем "ВидЦен" имеет значение "" тогда
		И из выпадающего списка с именем "ВидЦен" я выбираю точное значение 'Розничная'		
* Заполнение ТЧ Товары
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"
	Тогда открылось окно 'Товары'
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование' |
		| '000000017' | 'Bosch12345'      |
	И я нажимаю на кнопку с именем 'ФормаВыбрать'
	И в таблице "Товары" я активизирую поле с именем "ТоварыЦена"
	И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '100,00'
	И я перехожу к следующему реквизиту
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '1,00'
	И я перехожу к следующему реквизиту
	И в таблице "Товары" я завершаю редактирование строки
	* Проверка заполнения Поля Итог при заполнении 1 строки
		И элемент формы с именем "ТоварыИтогСумма" стал равен '100'
* Проверка заполнения ТЧ
	Тогда таблица "Товары" содержит строки:
		| 'Товар'      | 'Цена'   | 'Количество' | 'Сумма'  |
		| 'Bosch12345' | '100,00' | '1,00'       | '100,00' |
	И я нажимаю на кнопку "Записать"
* Номер
	И я запоминаю значение поля "Номер" как "$Номер$"
* Проведение документа
	И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
//	И я жду закрытия окна 'Поступление товаров: Накладная, УПД УРУР-002163 от *' в течение 20 секунд
* Проверка создания документа
	И таблица  "Список" содержит строки:
		| 'Номер'   |
		| '$Номер$' |

	И я закрываю все окна клиентского приложения

	