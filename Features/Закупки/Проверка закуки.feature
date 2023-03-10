#language: ru

@tree

Функционал: <описание фичи>

Как менеджер по закупкам я хочу зафиксировать заказанный товар

Контекст:
	Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: _0401 подготовительный сценарий (заказ поставщику)
	* Заполнение заказа поставщику
		Когда экспорт документов закупок
		И Я открываю навигационную ссылку "e1cib/list/Document.PurchaseOrder"
		И я нажимаю на кнопку с именем 'FormCreate'
		Тогда открылось окно 'Заказ поставщику (создание)'
		И я нажимаю кнопку выбора у поля с именем "Partner"
		Тогда открылось окно 'Партнеры'
		И в таблице "List" я перехожу к строке:
			| 'Наименование'               |
			| 'Поставщик 1 (1 соглашение)' |
		И я нажимаю на кнопку с именем 'FormChoose'				
		И в таблице "ItemList" я нажимаю на кнопку с именем 'ItemListAdd'
		И в таблице "ItemList" я нажимаю кнопку выбора у реквизита с именем "ItemListPartnerItem"
		Тогда открылось окно 'Номенклатура партнера'
		И в таблице "List" я перехожу к строке:
			| 'Description'                                         | 'Артикул'   | 'Код' |
			| 'Номенклатура поставщика 1 (товар без характеристик)' | 'AN1290800' | '3'   |
		И я нажимаю на кнопку с именем 'FormChoose'
		И в таблице "ItemList" я завершаю редактирование строки
	*Проверка заполнения цены из соглашения
		Тогда таблица "ItemList" стала равной:
			| 'N' | 'Номенклатура'            | 'Характеристика'          | 'Количество' | 'Ед. изм.' | 'Вид цены'          | 'Цена'   |
			| '1' | 'Товар без характеристик' | 'Товар без характеристик' | '1,000'      | 'шт'       | 'Цена поставщика 1' | '150,00' |
	* Изменения вида цен и проверка его перезаполнения при перевыборе соглашения
		И в таблице "ItemList" я активизирую поле с именем "ItemListPriceType"
		И в таблице "ItemList" я нажимаю кнопку выбора у реквизита с именем "ItemListPriceType"
		Тогда открылось окно 'Виды цен'
		И в таблице "List" я перехожу к строке:
			| 'Валюта' | 'Код' | 'Наименование' 			  | 'Ссылка' 			   |
			| 'USD'    | '4'   | 'Цена поставщика 2'          | 'Цена поставщика 2'    |
		И в таблице "List" я выбираю текущую строку
		И в таблице "ItemList" я завершаю редактирование строки
		Тогда таблица "ItemList" стала равной:
			| 'N' | 'Номенклатура'            | 'Характеристика'          | 'Количество' | 'Ед. изм.' | 'Вид цены'          | 'Цена' |
			| '1' | 'Товар без характеристик' | 'Товар без характеристик' | '1,000'      | 'шт'       | 'Цена поставщика 2' | ''     |
		И я нажимаю кнопку выбора у поля с именем "Agreement"
		Тогда открылось окно 'Соглашения'
		И в таблице "List" я перехожу к строке:
			| 'Наименование'               |
			| 'Соглашение с поставщиком 1' |
		И я нажимаю на кнопку с именем 'FormChoose'
		Тогда открылось окно 'Табличная часть товаров будет обновлена'
		И я нажимаю на кнопку с именем 'FormOK'
		Тогда таблица "ItemList" стала равной:
			| 'N' | 'Номенклатура'            | 'Характеристика'          | 'Количество' | 'Ед. изм.' | 'Вид цены'          | 'Цена'   |
			| '1' | 'Товар без характеристик' | 'Товар без характеристик' | '1,000'      | 'шт'       | 'Цена поставщика 1' | '150,00' |
		И я закрываю все окна клиентского приложения 
				
		

		
				
		 
