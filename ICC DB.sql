CREATE DATABASE icc;
use icc;

CREATE TABLE icc_admin 
(
member_id INT NOT NULL, 
name VARCHAR(30) NOT NULL, 
title VARCHAR(30) NOT NULL, 
salary INT NOT NULL, 
PRIMARY KEY (member_id) 
);


CREATE TABLE country_team
(
team_id INT NOT NULL,
team_name VARCHAR(20) NOT NULL, 
board VARCHAR(10) NOT NULL, 
admitted_year INT NOT NULL, 
approved_by INT NOT NULL, 
PRIMARY KEY (team_id), 
FOREIGN KEY (approved_by) REFERENCES icc_admin(member_id) 
);


CREATE TABLE tournament (

tournament_id INT NOT NULL, 
format VARCHAR(10) NOT NULL, 
year INT NOT NULL, 
hosts VARCHAR(20) NOT NULL, 
organized_by INT NOT NULL, 
PRIMARY KEY (tournament_id), 
FOREIGN KEY (organized_by) REFERENCES icc_admin(member_id) 
);

CREATE TABLE player
(

player_id INT NOT NULL,
player_name VARCHAR(30) NOT NULL,
role VARCHAR(20) NOT NULL,
team_id INT NOT NULL, 
PRIMARY KEY (player_id), 
FOREIGN KEY (team_id) REFERENCES country_team(team_id) 
);

CREATE TABLE award
(
award_name VARCHAR(30) NOT NULL,
award_year INT NOT NULL,
player_id INT NOT NULL,
member_id INT NOT NULL, 
PRIMARY KEY (award_name, award_year), 
FOREIGN KEY (player_id) REFERENCES player (player_id), 
FOREIGN KEY (member_id) REFERENCES icc_admin(member_id) 
);

CREATE TABLE matches
(
match_id INT NOT NULL,
played_date DATE,
venue VARCHAR(30) NOT NULL,
PRIMARY KEY (match_id)
);

CREATE TABLE teamA
(
match_id INT NOT NULL,
team_id INT NOT NULL,
score INT NOT NULL,
result VARCHAR(10) NOT NULL,
PRIMARY KEY (match_id, team_id),
FOREIGN KEY (match_id) REFERENCES matches(match_id),
FOREIGN KEY (team_id) REFERENCES country_team(team_id)
);

CREATE TABLE teamB
(
match_id INT NOT NULL,
team_id INT NOT NULL,
score INT NOT NULL,
result VARCHAR(10) NOT NULL,
PRIMARY KEY (match_id, team_id),
FOREIGN KEY (match_id) REFERENCES matches(match_id),
FOREIGN KEY (team_id) REFERENCES country_team(team_id)
);


CREATE TABLE match_stats
(
player_id INT NOT NULL, 
match_id INT NOT NULL, 
runs_scored INT NOT NULL, 
wickets_taken INT NOT NULL, 
PRIMARY KEY (player_id,match_id), 
FOREIGN KEY (match_id) REFERENCES matches(match_id),
FOREIGN KEY (player_id) REFERENCES player(player_id)
);

CREATE TABLE player_stats
(
player_id INT NOT NULL,
matches INT NOT NULL,
runs INT NOT NULL, 
average DECIMAL(4,2), 
strike_rate DECIMAL (5,2), 
100s INT NOT NULL,
highest INT NOT NULL,
wickets INT NOT NULL, 
economy INT NOT NULL, 
points INT NOT NULL, 
icc_rank INT NOT NULL, 
PRIMARY KEY (player_id), 
FOREIGN KEY (player_id) REFERENCES player(player_id)
);

-- ICC_Admin
INSERT INTO ICC_admin VALUES (201, 'Greg Barclay', 'Chairman', 1000000);
INSERT INTO ICC_admin VALUES (202, 'Shashank Manohar', 'EX-Chairman', 950000);
INSERT INTO ICC_admin VALUES (203, 'Clare Connor', 'Chair-Woman', 590400);
INSERT INTO ICC_admin VALUES (204, 'Clive Hitchcock', 'Secretary', 420000);
INSERT INTO ICC_admin VALUES (205, 'Ranjan Madugalle', 'Chief Referee', 400000);
INSERT INTO ICC_admin VALUES (206, 'Kyle Coetzer', 'Associate Repr.', 490000);
INSERT INTO ICC_admin VALUES (207, 'David Kendix', 'Statistician', 140000);
INSERT INTO ICC_admin VALUES (208, 'Matthew Mott', 'Coach Repr.', 300000);
INSERT INTO ICC_admin VALUES (209, 'Shaun Pollock', 'Media Repr.', 500000);
INSERT INTO ICC_admin VALUES (210, 'David White', 'Member Repr.', 600000);

-- Country_team
INSERT INTO Country_team VALUES (101, 'India', 'BCCI', 1926, 1);
INSERT INTO Country_team VALUES (102, 'Australia', 'CA', 1905, 3);
INSERT INTO Country_team VALUES (103, 'England', 'ECB', 1909, 4);
INSERT INTO Country_team VALUES (104, 'South Africa', 'CSA', 1909, 5);
INSERT INTO Country_team VALUES (105, 'West Indies', 'WCB', 1926, 4);
INSERT INTO Country_team VALUES (106, 'Pakistan', 'PCB', 1952, 6);
INSERT INTO Country_team VALUES (107, 'Sri Lanka', 'SLC', 1981, 7);
INSERT INTO Country_team VALUES (108, 'Bangladesh', 'BCB', 2000, 3);
INSERT INTO Country_team VALUES (109, 'Afghanistan', 'ACB', 2017, 2);
INSERT INTO Country_team VALUES (110, 'Zimbabwe', 'ZC', 1926, 6);

-- Tournament
INSERT INTO TOURNAMENT VALUES (301, 'ODI', 2011, 'India', 201);
INSERT INTO TOURNAMENT VALUES (302, 'T20I', 2016, 'India', 202);
INSERT INTO TOURNAMENT VALUES (303, 'ODI', 2015, 'Australia', 203);
INSERT INTO TOURNAMENT VALUES (304, 'ODI', 2019, 'England', 204);
INSERT INTO TOURNAMENT VALUES (305, 'WTC', 2021, 'Final (England)', 205);
INSERT INTO TOURNAMENT VALUES (306, 'T20I', 2021, 'India', 206);

-- Award
INSERT INTO AWARD VALUES ('ODI Player of The Decade', 2020, 206, 401);
INSERT INTO AWARD VALUES ('T20 Player of The Decade', 2020, 207, 409);
INSERT INTO AWARD VALUES ('Test Player of The Decade', 2020, 209, 417);
INSERT INTO AWARD VALUES ('Test Player of The Year', 2021, 205, 404);
INSERT INTO AWARD VALUES ('Spirit of Cricket Award of The Decade', 2020, 202, 418);
INSERT INTO AWARD VALUES ('ODI Player of The Year', 2021, 206, 419);

-- Matches
INSERT INTO MATCHES VALUES (501, '20-08-2022', 'Kolkata');
INSERT INTO MATCHES VALUES (502, '21-08-2022', 'Lords');
INSERT INTO MATCHES VALUES (503, '22-07-2022', 'MCG');
INSERT INTO MATCHES VALUES (504, '23-07-2021', 'Johannesburg');
INSERT INTO MATCHES VALUES (505, '24-05-2020', 'Dubai');
INSERT INTO MATCHES VALUES (506, '25-05-2022', 'Ahmedabad');
INSERT INTO MATCHES VALUES (507, '26-06-2021', 'Brisbane');
INSERT INTO MATCHES VALUES (508, '27-08-2020', 'Colombo');
INSERT INTO MATCHES VALUES (509, '28-09-2020', 'Kolkata');
INSERT INTO MATCHES VALUES (510, '29-10-2021', 'MCG');

-- Player
INSERT INTO player VALUES (401, 'Virat Kohli', 'Right Handed Batsman', 101);
INSERT INTO player VALUES (402, 'Rohit Sharma', 'Right Handed Batsman', 101);
INSERT INTO player VALUES (403, 'Jasprit Bumrah', 'Right Arm Fast Bowler', 101);
INSERT INTO player VALUES (404, 'Joe Root', 'Right Handed Batsman', 103);
INSERT INTO player VALUES (405, 'Ravichandran Ashwin', 'Off Break Bowler', 101);
INSERT INTO player VALUES (406, 'Ashton Agar', 'Slow Left Arm', 102);
INSERT INTO player VALUES (407, 'David Warner', 'Left Handed Batsman', 102);
INSERT INTO player VALUES (408, 'Shaheen Afridi', 'Left Arm Fast Bowler', 106);
INSERT INTO player VALUES (409, 'Rashid Khan', 'Leg Break Bowler', 109);
INSERT INTO player VALUES (410, 'Sikandar Raza', 'All Rounder', 110);
INSERT INTO player VALUES (411, 'Ben Stokes', 'All Rounder', 103);
INSERT INTO player VALUES (412, 'Nicholas Pooran', 'Wicket Keeper', 105);
INSERT INTO player VALUES (413, 'Maheesh Theekshana', 'Off Break Bowler', 107);
INSERT INTO player VALUES (414, 'Shakib Al Hasan', 'All Rounder', 108);
INSERT INTO player VALUES (415, 'Wanindu Hasaranga', 'Leg Break Bowler', 107);
INSERT INTO player VALUES (416, 'Quinton De Kock', 'Wicket Keeper', 104);
INSERT INTO player VALUES (417, 'Steve Smith', 'Right Handed Batsman', 102);
INSERT INTO player VALUES (418, 'MS Dhoni', 'Wicket Keeper', 101);
INSERT INTO player VALUES (419, 'Babar Azam', 'Right Handed Batsman', 106);

-- TEAMA--
INSERT INTO TEAMA VALUES(101,501,325,Won);
INSERT INTO TEAMA VALUES(103,502,215,Lost);
INSERT INTO TEAMA VALUES(102,503,376,Won);
INSERT INTO TEAMA VALUES(104,504,321,Won);
INSERT INTO TEAMA VALUES(106,505,298,Lost);
INSERT INTO TEAMA VALUES(101,506,412,Won);
INSERT INTO TEAMA VALUES(102,507,275,Won);
INSERT INTO TEAMA VALUES(107,508,283,Lost);
INSERT INTO TEAMA VALUES(101,509,356,Lost);
INSERT INTO TEAMA VALUES(102,510,225,Lost);

-- TEAMB--
INSERT INTO TEAMB VALUES(103,501,300,Lost);
INSERT INTO TEAMB VALUES(105,502,220,Won);
INSERT INTO TEAMB VALUES(109,503,276,Lost);
INSERT INTO TEAMB VALUES(108,504,311,Lost);
INSERT INTO TEAMB VALUES(102,505,300,Won);
INSERT INTO TEAMB VALUES(104,506,356,Lost);
INSERT INTO TEAMB VALUES(110,507,234,Lost);
INSERT INTO TEAMB VALUES(103,508,282,Won);
INSERT INTO TEAMB VALUES(102,509,357,Won);
INSERT INTO TEAMB VALUES(101,510,226,Won);

-- Match_stats
INSERT INTO match_stats VALUES (402, 501, 112, 1);
INSERT INTO match_stats VALUES (404, 501, 14, 2);
INSERT INTO match_stats VALUES (411, 502, 66, 4);
INSERT INTO match_stats VALUES (412, 502, 27, 0);
INSERT INTO match_stats VALUES (407, 503, 94, 0);
INSERT INTO match_stats VALUES (409, 503, 32, 6);
INSERT INTO match_stats VALUES (416, 504, 134, 0);
INSERT INTO match_stats VALUES (414, 504, 56, 3);
INSERT INTO match_stats VALUES (408, 505, 4, 4);
INSERT INTO match_stats VALUES (406, 505, 45, 2);
INSERT INTO match_stats VALUES (403, 506, 6, 4);
INSERT INTO match_stats VALUES (416, 506, 34, 0);
INSERT INTO match_stats VALUES (417, 507, 78, 1);
INSERT INTO match_stats VALUES (410, 507, 47, 2);
INSERT INTO match_stats VALUES (415, 508, 58, 5);
INSERT INTO match_stats VALUES (404, 508, 36, 0);
INSERT INTO match_stats VALUES (401, 509, 110, 0);
INSERT INTO match_stats VALUES (407, 509, 23, 0);
INSERT INTO match_stats VALUES (417, 510, 51, 1);
INSERT INTO match_stats VALUES (402, 510, 209, 0);

-- Player_stats
INSERT INTO player_stats VALUES(401,262,12344,183,57.68,92.44,43,4.6,22,744,5);
INSERT INTO player_stats VALUES(402,233,9376,264,48.58,89.18,29,8.5,21,740,6);
INSERT INTO player_stats VALUES(403,73,47,14,6.71,50.54,0,121,4,64,662,4);
INSERT INTO player_stats VALUES(404,158,6027,133,50.86,96.31,26,9.5,777,691,13);
INSERT INTO player_stats VALUES(405,113,707,65,16.44,86.96,0,151,4.94,NULL,NULL);
INSERT INTO player_stats VALUES(406,17,239,46,21.73,84.15,0,17,5.34,743,434,74);
INSERT INTO player_stats VALUES(407,135,5680,179,44.38,95.13,24,0.8,739,7);
INSERT INTO player_stats VALUES(408,83,102,19,17.68,46.89,5.1,661,5);
INSERT INTO player_stats VALUES(409,82,1114,60,21.62,60.69,0,158,4.17,651,8);
INSERT INTO player_stats VALUES(410,112,3648,101,36.85,84.42,6,70,4.9,NULL,30);
INSERT INTO player_stats VALUES(411,105,2942,102,38.99,95.89,3,74,6.5,NULL,NULL);
INSERT INTO player_stats VALUES(412,95,1555,118,46.16,96.1,9,6.5,NULL,29);
INSERT INTO player_stats VALUES(413,92,281,17,3.4,76.9,5.4,2,44,619,16);
INSERT INTO player_stats VALUES(414,231,6755,134,37.83,92.42,25,4.4,531,39);
INSERT INTO player_stats VALUES(415,31,604,80,12.57,103.42,8.1,531,39);
INSERT INTO player_stats VALUES(416,132,5774,178,46.19,96.2,2,17,7.6,817,15);
INSERT INTO player_stats VALUES(417,132,4554,164,41.28,91.1,28,5.4,617,22);
INSERT INTO player_stats VALUES(418,356,10773,183,50.58,87.56,10,1.5,517,NULL,NULL);
INSERT INTO player_stats VALUES(419,92,4664,158,59.79,89.74,17,0,NULL,890,1);
