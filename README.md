# online_store

Приложение интернет магазина

## Описание

Приложение интернет магазина, реализованное на 4 экранах. 

Описание экранов:

1. Экран регистрации/авторизации с базовой валидацией (данные не должны быть пустыми).
2. Экран отображения всех товаров. Каждый товар имеет изображение, наименование, описание и возможность добавить в избранное.
3. Экран избранных товаров, откуда можно удалить товар.
4. Экран профиль с отображением имени пользователя и возможностью выйти из аккаунта.

<img src="https://github.com/Ducascas/online_store/blob/master/assets/login_screen.png" width="240" height="460">
<img src="https://github.com/Ducascas/online_store/blob/master/assets/home_screen.png" width="240" height="460">
<img src="https://github.com/Ducascas/online_store/blob/master/assets/favorites_screen.png" width="240" height="460">
<img src="https://github.com/Ducascas/online_store/blob/master/assets/profile_screen.png" width="240" height="460">

## Особенности
- Приложение использует Riverpod для управления состоянием приложения.
- Для хранения данных используется локальная реляционная БД SQFLite.
- Для навигации между экранами используется пакет go_router.
