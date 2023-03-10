#language: ru

@tree

Функционал: Проверка отчета Остатки

Контекст:
	Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: Проверка отчета Остатки
	* Подготовка данных для отчета
		Тогда Подготовка тестовых данных
		Тогда Создание документа ПТУ
		И я выполняю код встроенного языка на сервере
		"""bsl
			Документы.ПриходТовара.НайтиПоНомеру("100000059").ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);
		"""
	* Формирование отчета
		И Я открываю навигационную ссылку "e1cib/app/Отчет.ОстаткиТоваровНаСкладах"
		И я нажимаю на кнопку с именем 'ФормаСформировать'
		И в табличном документе 'Результат' я перехожу к ячейке "R2C1"				
	* Проверка отчета
		И в табличном документе 'Результат' я перехожу к ячейке "R2C1"
		И в табличном документе "Результат" ячейка с адресом "R2C1" равна "Bosch12345"
		И в табличном документе 'Результат' я перехожу к ячейке "R2C3"
		И в табличном документе "Результат" ячейка с адресом "R2C3" равна "100,00"
	И я закрываю все окна клиентского приложения
		
						
