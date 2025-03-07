# DELETE

# подготовка данных (добавляем несколько сообщений между пользователями) 
INSERT INTO `private_messages`(sender_id, receiver_id, media_type, body, filename, created_at)
VALUES
(1,2,'text','Eveniet suscipit ullam occaecati consequatur hic. Nulla est in molestiae odit. Placeat perferendis consequatur qui omnis id vel autem.','officiis','2010-04-07 09:01:02'),
(2,1,'audio','Non repudiandae maiores molestiae vel doloribus. Quis facere blanditiis est magnam est ut vero.','qui','1971-05-29 07:31:20'),
(1,3,'text','Voluptas qui consequatur quae sunt et consequatur. Rem alias sed cupiditate explicabo voluptate. Officiis repellat porro accusamus eveniet quos. Laborum dolores sed enim aut.','excepturi','1998-10-28 20:08:01'),
(1,4,'video','Est delectus tempora exercitationem atque tempora reiciendis nulla voluptatem. Cupiditate non fugit blanditiis quasi ad et autem expedita. Aut est provident odio quasi possimus.','vitae','2001-12-03 15:54:43'),
(1,2,'video','Est ducimus amet et asperiores. Reiciendis debitis qui ipsa. Nemo laboriosam ea aut omnis voluptates quisquam accusantium. Quibusdam totam similique aut.','optio','1970-09-18 20:39:35'),
(1,2,'video','Quis cupiditate quis maxime et placeat consectetur ut quis. Voluptas unde voluptatem deserunt in dolorum maxime. Sunt fugiat sit tenetur placeat at.','laboriosam','1980-05-11 03:39:43'),
(2,1,'audio','Voluptatum nihil rem laboriosam delectus aperiam consequuntur et modi. Laudantium molestias corporis quo omnis ut ea. At minima iure et voluptatum culpa deleniti non. Sint laboriosam molestias dolor vel. Quibusdam omnis quas ullam dolor.','sit','1988-08-19 10:30:44'),
(2,4,'audio','Nemo eos sed aspernatur voluptates perspiciatis tenetur. Voluptas sunt magnam vero nam earum. Magnam eum vitae qui. Vel atque accusantium in non rem non et.','consectetur','1984-06-28 16:22:44'),
(4,5,'audio','Quod nihil possimus id qui. Quasi officia rerum eum doloribus est voluptas maxime. Et debitis enim non enim fugit.','repellat','1981-12-11 16:04:11'),
(3,1,'text','Qui voluptatem earum temporibus rem vel sequi. Et quasi vel qui est autem aliquam. Modi est voluptatem aut rerum ea velit. Voluptate et eligendi debitis nostrum nihil dolorum.','nihil','1988-02-16 13:29:14'),
(3,2,'image','Rem et ullam cum vitae autem reprehenderit quia. Enim a ipsam id ut aliquam est error. Quis dolorum omnis expedita eaque maiores illo.','et','2015-04-07 18:02:42')
;

# удаляем сообщения от пользователя номер 1 к пользователю номер 2
DELETE FROM private_messages
WHERE sender_id = 1 AND receiver_id = 2;

# пробуем удалить пользователя номер 3
DELETE FROM users
WHERE id = 3;

# сначала удаляем его подписки на каналы
DELETE FROM channel_subscribers 
WHERE user_id = 3;

# удаляем сообщения пользователя номер 3
DELETE FROM private_messages
WHERE sender_id = 3 OR receiver_id = 3;

# добавим флаг для удаленных сообщений (вместо физического удаления строк) 
ALTER TABLE private_messages ADD COLUMN is_deleted BIT NOT NULL DEFAULT 0;

# отмечаем сообщения удаленными
UPDATE private_messages
SET is_deleted = 1 
WHERE sender_id = 2 AND receiver_id = 1;

# удаляем все строки из таблицы сообщений
DELETE FROM private_messages;

# пересоздаем таблицу сообщений (DROP-CREATE)
TRUNCATE private_messages;

	








































































































































































































































































































































































































































































































































































































































































































