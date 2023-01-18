use mydb;
-- select * from users;
-- select id, last_name from users;
-- select name, price from products;
-- select name as 名前, price as 価格 from products;
-- select name 名前, price 価格 from products;
-- select name as 名前, price as 価格, price * 1.1 as 税込価格 from products;
-- select name, price from products where price >= 9800;
-- select * from products where id = 1;
-- select * from products where name = '商品0003';
-- select * from products where price > 1000;
-- select * from products where price <> 100;
-- select * from products where  price != 100;
-- select * from products where id in(1, 2, 3);
-- select * from products where id not in(1, 2, 3);
-- select * from products where price is not null;
-- select * from products where price is null;
-- select * from products where price between 1000 and 1900;
-- select * from products where price >= 1000 and price <=1900;
-- select * from products where price = 1000 or price = 2000;
-- select * from users where last_name like '中%';
-- select * from users where last_name like '%中%';
-- select * from users where first_name like '%子';
-- select * from users where first_name like '__子';
-- select * from products limit 10;
-- select * from products limit 10, 10; -- 11番目から10件表示
-- select id, last_name, gender from users where gender = 1 limit 10;
-- select * from orders;
-- select sum(amount) from orders where order_time >= '2017-01-01 00:00:00' and order_time < '2017-02-01 00:00:00'
-- select avg(price) from products;
-- select min(price) from products;
-- select max(price) from products;
-- select count(*) from users; -- count(*)で行数をカウントする
-- select count(*) from users where gender = 2;
-- select count(distinct user_id) from access_logs where request_month = '2017-01-01'; -- countの引数にdistinctをつけることで重複を削除してcount
-- select prefecture_id, count(*) from users group by prefecture_id; -- group byでpre_idごとに並べ替え、countするイメージ
-- select request_month, count(distinct user_id) from access_logs where request_month >= '2017-01-01' and request_month < '2018-01-01' group by request_month;
-- select  request_month, count(distinct user_id) from access_logs group by request_month having count(distinct user_id) >= 630;

-- 記述順序： 1.select 2.from 3.where 4.group by 5.having 6.order by 7.limit
-- 実行順序： 1.from 2.where 3.group by 4.having 5.select 6.order by 7.limit
-- ！selectの記述順序と記述順序が異なる！

-- select * from access_logs;
-- select * from access_logs where request_month >= '2017-01-01' and request_month < '2017-07-01';
-- select request_month, count(*) from access_logs where request_month >= '2017-01-01' and request_month < '2017-07-01' group by request_month;
-- select request_month, count(*) from access_logs where request_month >= '2017-01-01' and request_month < '2017-07-01' group by request_month having count(*) >= 1000;

-- select * from products order by price desc;
-- select * from products order by price asc; -- ascは省略可（デフォルト）
-- select * from products order by price desc, id asc;
-- select * from users order by birthday asc, prefecture_id asc;

-- select 10 + 3;
-- select 10 - 3;
-- select 10 * 3;
-- select 10 / 3;
-- select 10 % 3;
-- select 10 + null;
-- select 10 - null;
-- elect 10 * null;
-- select 10 / null;
-- select 10 % null;
-- select abs(10);
-- select abs(-10);
-- select *, round(price * 1.08, 0) from products;
-- select round(10.555, 1); -- 小数第1位まで表示（第2位を四捨五入）

-- select concat(last_name, ' ', first_name,'さん') from users;
-- select concat(last_name,'さん'), email from users where gender = 2;

-- select current_date();
-- select current_timestamp();
-- select current_date() + interval 3 day;
-- select current_time() + interval 6 hour;
-- select current_time() - interval 6 hour;
-- extract: 日付や時刻の特定の部分（年や月）までを取り出す
-- select * from orders where extract(year_month from order_time) = 201701;
-- select * from orders where extract(year from order_time) = 2017;
-- select * from orders where extract(month from order_time) = 1;
-- select users.id, users.last_name, users.first_name, prefectures.name from users inner join prefectures on users.prefecture_id = prefectures.id;
-- select u.id, u.last_name, u.first_name, p.name from users u inner join prefectures p on u.prefecture_id = p.id;
-- select u.id, u.last_name, u.first_name, p.name from users u inner join prefectures p on u.prefecture_id = p.id where u.gender = 2;

-- 記述順序： 1.select 2.from 3.結合処理 4.where 5.group by 6.having 7.order by 8.limit
-- 実行順序： 1.from 2.結合処理 3.where 4.group by 5.having 6.select 7.order by 8.limit

/* select
	o.id, o.order_time, o.amount, u.id, u.last_name, u.first_name, p.id
from
	orders o
inner join
	users u on o.user_id = u.id
inner join
	prefectures p on u.prefecture_id = p.id 
where
	o.order_time like '2017-01%' and p.name = '東京都'; */

-- select u.last_name, u.id user_id, o.user_id order_user_id, o.id order_id from users u inner join orders o on u.id = o.user_id order by u.id;
-- select u.last_name, u.id user_id, o.user_id order_user_id, o.id order_id from users u left outer join orders o on u.id = o.user_id order by u.id;
-- select p.id, p.name, sum(od.product_qty) from products p left outer join order_details od on p.id = od.product_id group by p.id;

/* select o.id order_id, o.user_id user_id, o.amount, o.order_time, p.name product_name, od.product_qty qty, p.price
from orders o inner join order_details od on o.id = od.order_id inner join products p on od.product_id = p.id; */

/* select o.id order_id, o.user_id user_id, u.last_name, u.first_name, o.amount, o.order_time, p.name product_name, od.product_qty qty, p.price
from orders o
inner join order_details od on o.id = od.order_id
inner join products p on od.product_id = p.id
inner join users u on o.user_id = u.id; */

/* select p.id product_id, p.name, c.name from products p
inner join products_categories pc on p.id = pc.product_id
inner join categories c on pc.category_id = c.id
where p.id = 3; */

/* select email, last_name, first_name, gender from users
union -- union all で重複を削除せず表示
select email, last_name, first_name, gender from admin_users; */

/* select email, last_name, first_name, gender from users where gender = 1
union -- union all で重複を削除せず表示
select email, last_name, first_name, gender from admin_users where gender = 2
order by gender; -- whereやhavingはunion前にそれぞれ使えるが、order by はunion後の最後のみ */

-- ビューの作成と削除
/* create view prefecture_user_counts(name, count)
as
select p.name, count(*) count from users u inner join prefectures p on u.prefecture_id = p.id group by p.id; */
-- select name, count from prefecture_user_counts; -- prefecture_user_countsという作成されたビューを呼び出し（sqlを実行）
-- drop view prefecture_user_counts;
