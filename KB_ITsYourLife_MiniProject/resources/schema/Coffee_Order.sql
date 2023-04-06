--DB ����

--�޴� ���̺� (�޴��ڵ�� �̸�, HOT/ICE����)
CREATE TABLE tbl_menu(
    beverage_code number(8) primary key,
    beverage_name varchar2(50) unique,
    hot_price number(8) not null,
    ice_price number(8) not null
);

CREATE SEQUENCE seq_menu
START WITH 1
INCREMENT BY 1;

INSERT INTO tbl_menu values(1, '�Ƹ޸�ī��', 4500, 5000);
INSERT INTO tbl_menu values(2, 'ī���', 5500, 6000);
INSERT INTO tbl_menu values(3, 'īǪġ��', 5000, 5500);
INSERT INTO tbl_menu values(4, '��������', 6000, 6500);
INSERT INTO tbl_menu values(5, 'ī���ī', 5000, 5500);
INSERT INTO tbl_menu values(6, '�ݵ���', 4500, 5000);
INSERT INTO tbl_menu values(7, '����������', 4000, 4500);
INSERT INTO tbl_menu values(8, '����ī��', 6500, 7000);
INSERT INTO tbl_menu values(9, '���ڶ�', 5800, 6300);

SELECT * FROM tbl_menu;
select * from tbl_menu where beverage_name LIKE '%ī��%';
select * from tbl_menu where beverage_name LIKE '%��%';

--�ֹ� ���̺� (�ֹ���ȣ, �ֹ����̵�, �ֹ���¥)
CREATE TABLE tbl_order(
    order_num_seq number(4) primary key,
    G_H number(1) check(G_H in(1, 2)), --1�̸� GO, 2�̸� HERE  
    order_date Date default sysdate,
    total_price number(8)           -- SUM(each_price)
);

CREATE SEQUENCE seq_order
START WITH 1
INCREMENT BY 1;

INSERT INTO tbl_order(order_num_seq, order_date) VALUES(seq_order.NEXTVAL, DEFAULT);
INSERT INTO tbl_order(order_num_seq, order_date) VALUES(seq_order.NEXTVAL, DEFAULT);
INSERT INTO tbl_order(order_num_seq, order_date) VALUES(seq_order.NEXTVAL, DEFAULT);
INSERT INTO tbl_order(order_num_seq, order_date) VALUES(seq_order.NEXTVAL, DEFAULT);
INSERT INTO tbl_order(order_num_seq, order_date) VALUES(seq_order.NEXTVAL, DEFAULT);

SELECT * FROM tbl_order;


--�ֹ��� ���̺�(�ֹ���ȣ�� �����ϱ� ���� �ֹ����̺��� orderNum�� FK ����)
--(���ֹ��ڵ�, �ֹ���ȣ(FK), �޴���ȣ(�̸�), HOT/ICE, ����, ����)
CREATE TABLE tbl_detail_order(
    order_code number(4) primary key,
    order_num number(2) constraint fk_seqorder REFERENCES tbl_order(order_num_seq),
    menu_name varchar(20),
    H_I number(1) check(H_I in(1, 2)), --1�̸� HOT, 2�̸� ICE
    amount number(2),
    each_price number(8)     --AMOUNT X PRICE   
);


INSERT INTO tbl_detail_order(order_code, order_num) VALUES(1, seq_order.currVAL);
INSERT INTO tbl_detail_order(order_code, order_num) VALUES(2, seq_order.currVAL);
INSERT INTO tbl_detail_order(order_code, order_num) VALUES(3, seq_order.currVAL);
INSERT INTO tbl_detail_order(order_code, order_num) VALUES(4, seq_order.currVAL);
INSERT INTO tbl_detail_order(order_code, order_num) VALUES(5, seq_order.currVAL);

SELECT * FROM tbl_detail_order;

commit; --���̺� �����Ǿ������� COMMIT���� ����. ROLLBACK ����!
rollback;








