﻿#language: ru

@tree

Функционал: Тестовое задание 4 модуля 

Как обучающийся я хочу
выполнить тестовое задание 
чтобы приступить к 5 модулю 

Контекст:
	Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: Проверка заполнения полей Заказа
	И я закрываю все окна клиентского приложения
	* Создание документа
		И В командном интерфейсе я выбираю 'Продажи' 'Заказы покупателей'
		Тогда открылось окно 'Заказы покупателей'
		И я нажимаю на кнопку с именем 'FormCreate'		
	* Проверка блокировки поля контрагент
		И элемент формы "Контрагент" не доступен	
	* Проверка заполнения полей Партнер
		И я нажимаю кнопку выбора у поля с именем "Partner"
		Тогда открылось окно 'Партнеры'
		И в таблице "List" я перехожу к строке:
			| 'Код' | 'Наименование'            |
			| '2'   | 'Клиент 2 (2 соглашения)' |
		И я нажимаю на кнопку с именем 'FormChoose'
		И элемент формы "Партнер" стал равен "Клиент 2 (2 соглашения)"
	* Проверка разблокировки поля контрагент после выбора партнера
		И элемент формы "Контрагент" доступен
	* Проверка заполнения поля Соглашение
		И я нажимаю кнопку выбора у поля с именем "Agreement"
		Тогда открылось окно 'Соглашения'
		И в таблице "List" я перехожу к строке:
			| 'Код' | 'Наименование'                                        |
			| '2'   | 'Индивидуальное соглашение 1 (расчет по соглашениям)' |
		И я нажимаю на кнопку с именем 'FormChoose'
		И элемент формы "Соглашение" стал равен "Индивидуальное соглашение 1 (расчет по соглашениям)"	

Сценарий: Проверка выполнения отчета D2001 Продажи
	И я закрываю все окна клиентского приложения
	* Формирование отчета
		И В командном интерфейсе я выбираю 'Отчеты' 'D2001 Продажи'
		Тогда открылось окно 'D2001 Продажи'
		И я нажимаю на кнопку с именем 'FormGenerate'		
	* Проверка возврата
		И в табличном документе "Result" ячейка с адресом "R14C2" равна "-2,000" по шаблону
				

