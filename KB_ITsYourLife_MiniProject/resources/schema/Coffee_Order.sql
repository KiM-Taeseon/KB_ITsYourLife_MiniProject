--DB ����

--�޴� ���̺� (�޴��ڵ�� �̸�, HOT/ICE����)
CREATE TABLE tbl_menu(
    beverageName varchar2(50) primary key,
    hot_price number(8) not null,
    ice_price number(8) not null
);


INSERT INTO tbl_menu values('�Ƹ޸�ī��', 4500, 5000);
INSERT INTO tbl_menu values('ī���', 5500, 6000);
INSERT INTO tbl_menu values('īǪġ��', 5000, 5500);
INSERT INTO tbl_menu values('��������', 6000, 6500);
INSERT INTO tbl_menu values('ī���ī', 5000, 5500);
INSERT INTO tbl_menu values('�ݵ���', 4500, 5000);
INSERT INTO tbl_menu values('����������', 4000, 4500);
INSERT INTO tbl_menu values('����ī��', 6500, 7000);
INSERT INTO tbl_menu values('���ڶ�', 5800, 6300);

SELECT * FROM tbl_menu;
select * from tbl_menu where beverageName LIKE '%ī��%';
select * from tbl_menu where beverageName LIKE '%��%';

--�ֹ� ���̺� (�ֹ���ȣ, �ֹ����̵�, �ֹ���¥)
CREATE TABLE tbl_order(
    orderNum_seq number(4) primary key,
    memberID varchar2(20),
    orderDate Date default sysdate
);

CREATE SEQUENCE seq_order
START WITH 1
INCREMENT BY 1;

INSERT INTO tbl_order(orderNum_seq, orderDate) VALUES(seq_order.NEXTVAL, DEFAULT);
INSERT INTO tbl_order(orderNum_seq, orderDate) VALUES(seq_order.NEXTVAL, DEFAULT);
INSERT INTO tbl_order(orderNum_seq, orderDate) VALUES(seq_order.NEXTVAL, DEFAULT);
INSERT INTO tbl_order(orderNum_seq, orderDate) VALUES(seq_order.NEXTVAL, DEFAULT);
INSERT INTO tbl_order(orderNum_seq, orderDate) VALUES(seq_order.NEXTVAL, DEFAULT);

SELECT * FROM tbl_order;


--�ֹ��� ���̺�(�ֹ���ȣ�� �����ϱ� ���� �ֹ����̺��� orderNum�� FK ����)
--(���ֹ��ڵ�, �ֹ���ȣ(FK), �޴���ȣ(�̸�), HOT/ICE, ����, ����)
CREATE TABLE tbl_detailorder(
    orderCod number(8) primary key,
    orderNum number(2) constraint fk_seqorder REFERENCES tbl_order(orderNum_seq),
    menuName varchar(20),
    hot varchar(1),
    ice varchar(1),
    amount number(2),
    totalPrice number(8)        
);

CREATE SEQUENCE seq_detailorder
START WITH 1
INCREMENT BY 1;

INSERT INTO tbl_detailorder(orderCod, orderNum) VALUES(001, seq_order.NEXTVAL);
INSERT INTO tbl_detailorder(orderCod, orderNum) VALUES(002, seq_detailorder.NEXTVAL);
INSERT INTO tbl_detailorder(orderCod, orderNum) VALUES(003, seq_detailorder.NEXTVAL);
INSERT INTO tbl_detailorder(orderCod, orderNum) VALUES(004, seq_detailorder.NEXTVAL);
INSERT INTO tbl_detailorder(orderCod, orderNum) VALUES(005, seq_detailorder.NEXTVAL);

SELECT * FROM tbl_detailorder;

commit; --���̺� �����Ǿ������� COMMIT���� ����. ROLLBACK ����!
rollback;






