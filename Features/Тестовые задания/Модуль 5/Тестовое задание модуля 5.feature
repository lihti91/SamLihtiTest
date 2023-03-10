#language: ru

@tree

Функционал: Тестовое задание модуля 5

Как ученик я хочу сдать тест 

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Создание 10 номенклатур
	И Я запоминаю в переменную "Шаг" значение "1"
	И Я запоминаю в переменную "Артикул" значение "159"
	И я делаю 10 раз
		И Я запоминаю значение выражения '"Товар " + $Шаг$' в переменную "НаименованиеТовара"
		И я проверяю или создаю для справочника "Items" объекты:
			| 'Ref'                                                                                       | 'Unit'                                                          | 'Vendor'                                                           | 'ItemID'    | 'Description_en'       | ItemType                                                            |
			| '{"e1cib/data/Catalog.Items?ref=" + СтрЗаменить(Новый УникальныйИдентификатор(), "-", "")}' | 'e1cib/data/Catalog.Units?ref=b762b13668d0905011eb76684b9f687b' | 'e1cib/data/Catalog.Partners?ref=b762b13668d0905011eb7663e35d794d' | '$Артикул$' | '$НаименованиеТовара$' | 'e1cib/data/Catalog.ItemTypes?ref=b762b13668d0905011eb76684b9f6879' |
		И Я запоминаю значение выражения '$Шаг$ + 1' в переменную "Шаг"
		И Я запоминаю значение выражения '$Артикул$ + 1' в переменную "Артикул"
			
Сценарий: Проверка заполнения поля организация
	И я закрываю все окна клиентского приложения
	* Создание заказ
		И В командном интерфейсе я выбираю 'Продажи' 'Заказы покупателей'
		Тогда открылось окно 'Заказы покупателей'
		И я нажимаю на кнопку с именем 'FormCreate'
		Тогда открылось окно 'Заказ покупателя (создание)'
	* Заполнение шапки
		И я нажимаю кнопку выбора у поля с именем "Agreement"
		Когда открылось окно 'Соглашения'
		И в таблице "List" я перехожу к строке:
			| 'Вид'     | 'Код' | 'Наименование' |
			| 'Обычное' | '10'  | 'ТЕст'         |
		И я нажимаю на кнопку с именем 'FormChoose'
	* Проверка заполнения организации
		Если элемент формы с именем "Company" присутствует на форме Тогда
			Если элемент формы с именем "Company" имеет значение "" тогда
				И я нажимаю кнопку выбора у поля с именем "Company"
				Тогда открылось окно 'Организации'
				И в таблице "List" я перехожу к строке:
					| 'Код' | 'Наименование'           |
					| '2'   | 'Собственная компания 2' |
				И я нажимаю на кнопку с именем 'FormChoose'
							
			
		
		
