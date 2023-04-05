--DB ����

--�޴� ���̺� (�޴��ڵ�� �̸�, HOT/ICE����)
CREATE TABLE tbl_menu(
    beverageCode number(3) primary key,
    beverageName varchar2(50) not null,
    hot_price number(8) not null,
    ice_price number(8) not null
);

INSERT INTO tbl_menu values(111, 'americano', 4500, 5000);
INSERT INTO tbl_menu values(222, 'cafelatte', 5500, 6000);
INSERT INTO tbl_menu values(333, 'cappuccino', 5000, 5500);
INSERT INTO tbl_menu values(444, 'macchiato', 6000, 6500);
INSERT INTO tbl_menu values(555, 'cafemoca', 5000, 5500);
INSERT INTO tbl_menu values(666, 'coldbrew', 4500, 5000);
INSERT INTO tbl_menu values(777, 'espresso', 4000, 4500);
INSERT INTO tbl_menu values(888, 'affogato', 6500, 7000);
INSERT INTO tbl_menu values(999, 'chocolatte', 5800, 6300);

SELECT * FROM tbl_menu;


--�ֹ� ���̺� (�ֹ���ȣ, �ֹ���, �ֹ���¥)
CREATE TABLE tbl_order(
    orderNum_seq number(4) primary key,
    memberName varchar2(20),
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


--�ֹ��� ���̺�(�ֹ���ȣ�� �����ϱ� ���� �ֹ����̺��� orderNum�� PK, FK ����)
--(�ֹ���ȣ, ��� �޴� ����, �ֹ��Ѿ�)
CREATE TABLE tbl_detailorder(
    orderNum number(2) primary key
                        constraint fk_seqorder REFERENCES tbl_order(orderNum_seq), 
    americano number(2),        --�޴�1
    cafelatte number(2),        --�޴�2
    cappuccino number(2),       --�޴�3
    macchiato number(2),        --�޴�4
    cafemoca number(2),         --�޴�5
    coldbrew number(2),         --�޴�6
    espresso number(2),         --�޴�7
    affogato number(2),         --�޴�8
    chocolatte number(2),        --�޴�9
    totalPrice number(8)        --�ѱݾ�
);


SELECT * FROM tbl_detailorder;

commit; --���̺� �����Ǿ������� COMMIT���� ����. ROLLBACK ����!







