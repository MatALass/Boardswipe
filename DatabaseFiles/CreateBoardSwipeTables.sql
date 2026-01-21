CREATE TABLE User_(
   id_user INT,
   userName VARCHAR(255),
   userEmail VARCHAR(255),
   userPassword VARCHAR(255),
   userDescription VARCHAR(255),
   PRIMARY KEY(id_user)
);

CREATE TABLE Guild(
   id_guild INT,
   guildName VARCHAR(255) NOT NULL,
   PRIMARY KEY(id_guild)
);

CREATE TABLE Message(
   id_chat VARCHAR(50),
   message_text VARCHAR(50),
   message_date VARCHAR(50),
   id_guild INT NOT NULL,
   id_user INT NOT NULL,
   PRIMARY KEY(id_chat),
   FOREIGN KEY(id_guild) REFERENCES Guild(id_guild),
   FOREIGN KEY(id_user) REFERENCES User_(id_user)
);

CREATE TABLE Quiz(
   id_quiz VARCHAR(50),
   Quiz_title VARCHAR(50),
   PRIMARY KEY(id_quiz)
);

CREATE TABLE GameCategory (
   IdCategory VARCHAR(255),
   CategoryName VARCHAR(255),
   PRIMARY KEY(IdCategory)
);

CREATE TABLE GamePublisher(
   IdPublisher VARCHAR(255),
   PublisherName VARCHAR(255),
   PRIMARY KEY(IdPublisher)
);

CREATE TABLE Game(
   id_game INT,
   gameName VARCHAR(255),
   gameDescription Text,
   gameYearPublished BIGINT,
   gameMinPlayers INT,
   gameMaxPlayers INT,
   gamePlayingTime INT,
   gameMinAge INT,
   gamePublisher VARCHAR(255),
   gameUrl VARCHAR(255),
   rankRating INT,
   avgRating DECIMAL(15,2),
   nbUserRating INT,
   id_quiz VARCHAR(50) NOT NULL,
   PRIMARY KEY(id_game),
   FOREIGN KEY(id_quiz) REFERENCES Quiz(id_quiz)
);

CREATE TABLE Comment(
   id_comment INT,
   commentText VARCHAR(1275),
   commentDate DATE,
   commentRating INT,
   id_game INT NOT NULL,
   id_user INT NOT NULL,
   PRIMARY KEY(id_comment),
   FOREIGN KEY(id_game) REFERENCES Game(id_game),
   FOREIGN KEY(id_user) REFERENCES User_(id_user)
);

CREATE TABLE UserBelongsToGuild(
   id_user INT,
   id_guild INT,
   role VARCHAR(50),
   PRIMARY KEY(id_user, id_guild),
   FOREIGN KEY(id_user) REFERENCES User_(id_user),
   FOREIGN KEY(id_guild) REFERENCES Guild(id_guild)
);

CREATE TABLE FavoriteGame(
   id_game INT,
   id_user INT,
   PRIMARY KEY(id_game, id_user),
   FOREIGN KEY(id_game) REFERENCES Game(id_game),
   FOREIGN KEY(id_user) REFERENCES User_(id_user)
);

CREATE TABLE UserLeaderBoard(
   id_user INT,
   id_quiz VARCHAR(50),
   score VARCHAR(50),
   rank_ VARCHAR(50),
   PRIMARY KEY(id_user, id_quiz),
   FOREIGN KEY(id_user) REFERENCES User_(id_user),
   FOREIGN KEY(id_quiz) REFERENCES Quiz(id_quiz)
);

CREATE TABLE Swipe(
   id_game INT,
   id_user INT,
   PRIMARY KEY(id_game, id_user),
   FOREIGN KEY(id_game) REFERENCES Game(id_game),
   FOREIGN KEY(id_user) REFERENCES User_(id_user)
);

CREATE TABLE Category(
   id_game INT,
   IdCategory VARCHAR(50),
   PRIMARY KEY(id_game, IdCategory),
   FOREIGN KEY(id_game) REFERENCES Game(id_game),
   FOREIGN KEY(IdCategory) REFERENCES GameCategory(IdCategory)
);

CREATE TABLE Publisher(
   id_game INT,
   IdPublisher VARCHAR(50),
   PRIMARY KEY(id_game, IdPublisher),
   FOREIGN KEY(id_game) REFERENCES Game(id_game),
   FOREIGN KEY(IdPublisher) REFERENCES GamePublisher(IdPublisher)
);