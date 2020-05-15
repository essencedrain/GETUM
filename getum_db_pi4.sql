-- --------------------------------------------------------
-- 호스트:                          112.147.60.217
-- 서버 버전:                        10.3.22-MariaDB-0+deb10u1-log - Raspbian 10
-- 서버 OS:                        debian-linux-gnueabihf
-- HeidiSQL 버전:                  10.3.0.5771
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- getum 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `getum` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `getum`;

-- 테이블 getum.addr 구조 내보내기
CREATE TABLE IF NOT EXISTS `addr` (
  `a_no` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '배송지_idx',
  `a_name` varchar(30) NOT NULL COMMENT '수취자',
  `a_hp` char(11) NOT NULL COMMENT '연락처',
  `a_addr1` varchar(50) NOT NULL COMMENT '배송지(기본)',
  `a_addr2` varchar(50) NOT NULL COMMENT '배송지(상세)',
  `a_post` char(5) NOT NULL COMMENT '우편번호',
  `a_request` varchar(100) NOT NULL COMMENT '배송요청사항',
  `a_default_flag` tinyint(1) NOT NULL COMMENT '기본배송지F',
  `m_id` varchar(30) NOT NULL COMMENT '아이디',
  PRIMARY KEY (`a_no`),
  KEY `FK_member_TO_addr` (`m_id`),
  CONSTRAINT `FK_member_TO_addr` FOREIGN KEY (`m_id`) REFERENCES `member` (`m_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='배송지';

-- 테이블 데이터 getum.addr:~4 rows (대략적) 내보내기
/*!40000 ALTER TABLE `addr` DISABLE KEYS */;
INSERT INTO `addr` (`a_no`, `a_name`, `a_hp`, `a_addr1`, `a_addr2`, `a_post`, `a_request`, `a_default_flag`, `m_id`) VALUES
	(1, '구태형', '01067274321', '서울 구로구 구로중앙로18길 59', '1408호', '08302', '부재시 문 앞에 두고 가주세요', 1, 'moonkero'),
	(5, '구태형', '01062990941', '서울 강동구 풍산로 235', '3층 3333', '05208', '경비실에 맡겨주세요', 0, 'test'),
	(6, '김지연', '01062990941', '경기 의왕시 맑은내길 6', '김김김', '16072', '경비실에 맡겨주세요', 0, 'test'),
	(7, '김민균', '01062990941', '서울 관악구 양녕로 5', '거기요', '08757', 'ㄴㅁㅇㅇㄴㅁㄻㄴㅇㄹ', 1, 'test');
/*!40000 ALTER TABLE `addr` ENABLE KEYS */;

-- 테이블 getum.board1_notice 구조 내보내기
CREATE TABLE IF NOT EXISTS `board1_notice` (
  `b1_idx` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `b1_subject` varchar(100) NOT NULL COMMENT '제목',
  `b1_content` text NOT NULL COMMENT '내용',
  `b1_reg_date` datetime NOT NULL COMMENT '글작성일',
  `b1_modify_date` datetime NOT NULL COMMENT '글수정일',
  `b1_count` int(10) unsigned NOT NULL COMMENT '조회수',
  `m_id` varchar(30) NOT NULL COMMENT '아이디',
  PRIMARY KEY (`b1_idx`),
  KEY `FK_member_TO_board1_notice` (`m_id`),
  CONSTRAINT `FK_member_TO_board1_notice` FOREIGN KEY (`m_id`) REFERENCES `member` (`m_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COMMENT='공지사항';

-- 테이블 데이터 getum.board1_notice:~19 rows (대략적) 내보내기
/*!40000 ALTER TABLE `board1_notice` DISABLE KEYS */;
INSERT INTO `board1_notice` (`b1_idx`, `b1_subject`, `b1_content`, `b1_reg_date`, `b1_modify_date`, `b1_count`, `m_id`) VALUES
	(1, '제목', '내용', '1991-04-01 15:48:39', '2020-04-01 15:48:39', 3, 'admin'),
	(2, '제목2', '내용2', '1994-04-01 15:50:02', '2020-04-01 15:50:02', 1, 'admin'),
	(3, '제목3', '내용3', '1997-04-01 15:50:02', '2020-04-01 15:50:02', 2, 'admin'),
	(4, '제목4', '내용4', '2000-04-01 15:50:02', '2020-04-01 15:50:02', 1, 'admin'),
	(6, '제목6', '내용6', '2003-04-01 15:50:02', '2020-04-01 15:50:02', 2, 'admin'),
	(7, '제목7', '내용7', '2007-04-01 15:50:02', '2020-04-01 15:50:02', 1, 'admin'),
	(8, '제목8', '내용8', '2008-04-01 15:50:02', '2020-04-01 15:50:02', 1, 'admin'),
	(9, '[공지]온라인투어 실시간 항공_코로나19 사태로 인하여 현재 항공사들의 지속적인 단항/결항으로 항공권 취소 등의 문의', '[공지]온라인투어 실시간 항공_코로나19 사태로 인하여 현재 항공사들의 지속적인 단항/결항으로 항공권 취소 등의 문의', '2009-04-01 15:50:02', '2020-04-01 15:50:02', 2, 'admin'),
	(10, '[공지] 2019년 02월 ★편도특가★제주항공권 렌터카 이벤트 당첨안내', '[공지] 2019년 02월 ★편도특가★제주항공권 렌터카 이벤트 당첨안내', '2010-04-01 15:50:02', '2020-04-01 15:50:02', 2, 'admin'),
	(11, '[이벤트] 로켓배송5주년기념 \'나의 쿠팡이야기 수기공모전\' 당첨자 발표', '[이벤트] 로켓배송5주년기념 \'나의 쿠팡이야기 수기공모전\' 당첨자 발표', '2011-04-01 15:50:02', '2020-04-01 15:50:02', 5, 'admin'),
	(12, '[이벤트] 갤럭시 노트10 사전예약 쿠팡캐시 추첨 이벤트 당첨안내', '[이벤트] 갤럭시 노트10 사전예약 쿠팡캐시 추첨 이벤트 당첨안내', '2012-04-01 15:50:02', '2020-04-01 15:50:02', 5, 'admin'),
	(13, '추석맞이 로켓와우클럽 신규가입 이벤트 쿠팡캐시 당첨안내', '추석맞이 로켓와우클럽 신규가입 이벤트 쿠팡캐시 당첨안내', '2013-04-01 15:50:02', '2020-04-01 15:50:02', 3, 'admin'),
	(14, '2014 KCSI 소셜커머스 부문 2년 연속 1위 선정', '2014 KCSI 소셜커머스 부문 2년 연속 1위 선정', '2014-04-01 15:50:02', '2020-04-01 15:50:02', 5, 'admin'),
	(15, '쿠팡, 개인정보 대청소 캠페인', '쿠팡, 개인정보 대청소 캠페인', '2015-04-01 15:50:02', '2020-04-01 15:50:02', 8, 'admin'),
	(16, '1904 국가고객만족도(NCSI) 소셜커머스 부문 최초 9위 선정', '1904 국가고객만족도(NCSI) 소셜커머스 부문 최초 9위 선정', '2016-04-01 15:50:02', '2020-04-04 17:48:14', 16, 'admin'),
	(17, '[안내] 금융감독원 사칭 (쿠팡 사칭 포함) 악성코드 피해 주의 안내', '[안내] 금융감독원 사칭 (쿠팡 사칭 포함) 악성코드 피해 주의 안내', '2017-04-01 15:50:02', '2020-04-01 15:50:02', 11, 'admin'),
	(18, '[공지] 쿠팡캐시 사용 한도 제한 안내 ', '[공지] 쿠팡캐시 사용 한도 제한 안내 ', '2018-04-01 15:50:02', '2020-04-01 15:50:02', 5, 'admin'),
	(19, '[공지] 쿠팡 신한제휴카드, 쿠팡캐시 3% 무제한 적립 (연회비 면제)', '[공지] 쿠팡 신한제휴카드, 쿠팡캐시 3% 무제한 적립 (연회비 면제)', '2019-04-01 15:50:02', '2020-04-01 15:50:02', 8, 'admin'),
	(20, '[공지] 신종금융사기! 스미싱 주의바랍니다!!', '[공지] 신종금융사기! 스미싱 주의바랍니다!!', '2020-04-01 15:50:03', '2020-04-01 15:50:03', 7, 'admin');
/*!40000 ALTER TABLE `board1_notice` ENABLE KEYS */;

-- 테이블 getum.board2_free 구조 내보내기
CREATE TABLE IF NOT EXISTS `board2_free` (
  `b2_idx` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '자게_idx',
  `b2_subject` varchar(100) NOT NULL COMMENT '제목',
  `b2_content` text NOT NULL COMMENT '내용',
  `b2_reg_date` datetime NOT NULL COMMENT '글작성일',
  `b2_modify_date` datetime NOT NULL COMMENT '글수정일',
  `b2_count` int(10) unsigned NOT NULL COMMENT '조회수',
  `b2_delete_flag` tinyint(1) NOT NULL COMMENT '삭제F',
  `b2_origin` bigint(20) unsigned NOT NULL COMMENT '글번호',
  `b2_origin_step` bigint(20) unsigned NOT NULL COMMENT '글순서',
  `b2_origin_depth` bigint(20) unsigned NOT NULL COMMENT '글깊이',
  `m_id` varchar(30) NOT NULL COMMENT '아이디',
  PRIMARY KEY (`b2_idx`),
  KEY `FK_member_TO_board2_free` (`m_id`),
  CONSTRAINT `FK_member_TO_board2_free` FOREIGN KEY (`m_id`) REFERENCES `member` (`m_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COMMENT='자유게시판';

-- 테이블 데이터 getum.board2_free:~11 rows (대략적) 내보내기
/*!40000 ALTER TABLE `board2_free` DISABLE KEYS */;
INSERT INTO `board2_free` (`b2_idx`, `b2_subject`, `b2_content`, `b2_reg_date`, `b2_modify_date`, `b2_count`, `b2_delete_flag`, `b2_origin`, `b2_origin_step`, `b2_origin_depth`, `m_id`) VALUES
	(1, 'test', 'test', '2020-04-06 14:15:22', '2020-04-06 14:15:23', 19, 0, 1, 0, 0, 'admin'),
	(2, 'test333', '3test', '2020-04-06 18:25:49', '2020-04-06 18:25:49', 2, 0, 2, 0, 0, 'test'),
	(3, 'tessdf2321', '123124', '2020-04-06 18:28:19', '2020-04-06 18:28:19', 8, 1, 3, 0, 0, 'test'),
	(4, 'sfafaskljf;k', 'sdfkjsdkldfaslk;', '2020-04-06 18:31:21', '2020-04-06 18:31:21', 6, 2, 4, 0, 0, 'test'),
	(5, '테스트으으', '테스트으으', '2020-04-06 18:55:17', '2020-04-06 18:55:17', 9, 0, 5, 0, 0, 'moonkero'),
	(6, '답글 테스트', '답글 테스트', '2020-04-06 19:01:32', '2020-04-06 19:01:32', 9, 0, 3, 1, 1, 'moonkero'),
	(7, '답글에 답글 테스트', '답글에 답글 테스트', '2020-04-06 19:12:28', '2020-04-06 19:12:28', 4, 0, 3, 2, 2, 'moonkero'),
	(8, '안녕하세요우', '반급습니다', '2020-04-06 19:13:24', '2020-04-06 19:13:24', 23, 0, 8, 0, 0, 'moonkero'),
	(9, '운영자님 하이루', '하이루', '2020-04-06 19:13:35', '2020-04-06 19:13:35', 3, 0, 1, 1, 1, 'moonkero'),
	(10, '잘되는거 같은데?', '올 ㅋ', '2020-04-06 19:13:43', '2020-04-06 19:13:43', 11, 0, 10, 0, 0, 'moonkero'),
	(11, '잘되는거 같니?', '응', '2020-04-06 19:14:03', '2020-04-06 19:14:03', 13, 0, 10, 1, 1, 'test');
/*!40000 ALTER TABLE `board2_free` ENABLE KEYS */;

-- 테이블 getum.member 구조 내보내기
CREATE TABLE IF NOT EXISTS `member` (
  `m_id` varchar(30) NOT NULL COMMENT '아이디',
  `m_pwd` char(64) NOT NULL COMMENT '비밀번호',
  `m_name` varchar(30) NOT NULL COMMENT '이름',
  `m_email` varchar(50) NOT NULL COMMENT '이메일',
  `m_hp` char(11) NOT NULL COMMENT '휴대폰번호',
  `m_point` int(10) unsigned NOT NULL COMMENT '포인트',
  `m_join_date` datetime NOT NULL COMMENT '가입일',
  `m_birthday` date NOT NULL COMMENT '생일',
  `m_grade` tinyint(3) unsigned NOT NULL COMMENT '등급',
  `m_withdraw_flag` tinyint(1) NOT NULL COMMENT '탈퇴F',
  PRIMARY KEY (`m_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='회원';

-- 테이블 데이터 getum.member:~5 rows (대략적) 내보내기
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` (`m_id`, `m_pwd`, `m_name`, `m_email`, `m_hp`, `m_point`, `m_join_date`, `m_birthday`, `m_grade`, `m_withdraw_flag`) VALUES
	('admin', '9c98cd448c63af6003185595a4c67b407f2a720c4e7698d348d7d77664fb5175', '관리자', 'admin@getum.com', '01011112222', 999999999, '2020-03-27 11:04:27', '2020-01-01', 255, 0),
	('moonkero', '7a1ba8fed98b70464b77ebe0a64d409b24ff77d0237b1bb54fa1a02407b226a7', '구태형', 'moonkero@naver.com', '01067274321', 3272, '2020-03-27 11:04:27', '1988-11-17', 0, 0),
	('showkpkp', 'b887862a4602bcbfe0ae22871412664652465f095673eecd8795078d47236564', '서규봉', 'showkpkp@naver.com', '01067274321', 0, '2020-04-02 10:11:41', '1988-10-10', 0, 0),
	('sjoo961', '0fd8869c9cec54d6b2af4167f90e0ec073819ef247261d10bf2aa365a75cbcf7', '구수진', 'sjoo961@hanmail.net ', '01025973933', 0, '2020-03-30 12:56:11', '1965-06-21', 0, 0),
	('test', '7a1ba8fed98b70464b77ebe0a64d409b24ff77d0237b1bb54fa1a02407b226a7', '테스트1', 'test@test.com', '01033334444', 3035, '2020-03-27 11:04:27', '1997-04-13', 0, 0);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;

-- 테이블 getum.orderlist 구조 내보내기
CREATE TABLE IF NOT EXISTS `orderlist` (
  `o_no` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '주문_idx',
  `o_status` tinyint(3) unsigned NOT NULL COMMENT '주문상태',
  `o_order_date` datetime NOT NULL COMMENT '주문일',
  `o_total_price` int(10) unsigned NOT NULL COMMENT '총상품가격',
  `o_use_point` int(10) unsigned NOT NULL COMMENT '사용포인트',
  `o_delivery_flag` tinyint(1) NOT NULL COMMENT '배송비',
  `o_payment` int(10) unsigned NOT NULL COMMENT '총결제금액',
  `o_payment_method` tinyint(3) unsigned NOT NULL COMMENT '결제수단',
  `o_add_point` int(10) unsigned NOT NULL COMMENT '적립포인트',
  `o_name` varchar(30) NOT NULL COMMENT '수취자',
  `o_hp` char(11) NOT NULL COMMENT '연락처',
  `o_addr1` varchar(50) NOT NULL COMMENT '배송지(기본)',
  `o_addr2` varchar(50) NOT NULL COMMENT '배송지(상세)',
  `o_post` char(5) NOT NULL COMMENT '우편번호',
  `o_request` varchar(100) NOT NULL COMMENT '배송요청사항',
  `m_id` varchar(30) NOT NULL COMMENT '아이디',
  PRIMARY KEY (`o_no`),
  KEY `FK_member_TO_orderlist` (`m_id`),
  CONSTRAINT `FK_member_TO_orderlist` FOREIGN KEY (`m_id`) REFERENCES `member` (`m_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COMMENT='주문';

-- 테이블 데이터 getum.orderlist:~17 rows (대략적) 내보내기
/*!40000 ALTER TABLE `orderlist` DISABLE KEYS */;
INSERT INTO `orderlist` (`o_no`, `o_status`, `o_order_date`, `o_total_price`, `o_use_point`, `o_delivery_flag`, `o_payment`, `o_payment_method`, `o_add_point`, `o_name`, `o_hp`, `o_addr1`, `o_addr2`, `o_post`, `o_request`, `m_id`) VALUES
	(1, 0, '2020-03-27 11:05:42', 40500, 0, 1, 43500, 2, 405, '구태형', '01067274321', '서울 구로구 구로중앙로18길 59', '1408호', '08302', '부재시 문 앞에 두고 가주세요', 'moonkero'),
	(2, 0, '2020-03-27 16:41:27', 170200, 0, 1, 173200, 2, 1702, '구태형', '01067274321', '서울 구로구 구로중앙로18길 59', '1408호', '08302', '부재시 문 앞에 두고 가주세요', 'moonkero'),
	(3, 0, '2020-03-28 08:17:30', 717000, 0, 0, 717000, 2, 7170, '홍길동', '01067827646', '전남 장성군 서삼면 홍길동로 252-72', '4885호', '57232', '문 앞에 두고 가주세요', 'test'),
	(4, 0, '2020-03-28 08:17:56', 79200, 4200, 0, 75000, 3, 750, '홍길동', '01067827646', '전남 장성군 서삼면 홍길동로 252-72', '4885호', '57232', '문 앞에 두고 가주세요', 'test'),
	(5, 0, '2020-03-30 02:31:53', 39600, 0, 0, 39600, 2, 396, '구태형', '01067274321', '서울 구로구 구로중앙로18길 59', '1408호', '08302', '부재시 문 앞에 두고 가주세요', 'moonkero'),
	(6, 0, '2020-03-30 02:31:59', 19300, 0, 1, 22300, 3, 193, '구태형', '01067274321', '서울 구로구 구로중앙로18길 59', '1408호', '08302', '부재시 문 앞에 두고 가주세요', 'moonkero'),
	(7, 0, '2020-03-30 12:36:35', 15600, 0, 1, 18600, 2, 156, '홍길동', '01067827646', '전남 장성군 서삼면 홍길동로 252-72', '4885호', '57232', '문 앞에 두고 가주세요', 'test'),
	(8, 0, '2020-03-30 12:44:14', 57600, 0, 0, 57600, 2, 576, '구태형', '01067274321', '서울 구로구 구로중앙로18길 59', '1408호', '08302', '부재시 문 앞에 두고 가주세요', 'moonkero'),
	(9, 0, '2020-03-31 10:32:56', 133200, 3800, 0, 129400, 2, 1294, '정도전', '01105641046', '대전 유성구 계룡로 3', '6445호', '34175', '잘배송해주세요', 'test'),
	(10, 0, '2020-04-10 10:35:05', 15600, 0, 1, 18600, 3, 156, '김민균', '01062990941', '서울 강동구 풍산로 235', '3층 3333', '05208', '경비실에 맡겨주세요', 'test'),
	(11, 0, '2020-04-10 16:59:09', 38600, 0, 0, 38600, 1, 386, '김뚜뚜', '01062990941', '경기 의왕시 맑은내길 6', '김김김', '16072', '경비실에 맡겨주세요', 'test'),
	(12, 0, '2020-04-10 18:00:51', 19800, 0, 1, 22800, 1, 198, '김뚜뚜', '01062990941', '경기 의왕시 맑은내길 6', '김김김', '16072', '경비실에 맡겨주세요', 'test'),
	(13, 0, '2020-04-13 16:23:30', 19300, 0, 1, 22300, 1, 193, '김뚜뚜', '01062990941', '경기 의왕시 맑은내길 6', '김김김', '16072', '경비실에 맡겨주세요', 'test'),
	(14, 0, '2020-04-14 14:25:26', 13500, 0, 1, 16500, 1, 135, '김뚜뚜', '01062990941', '경기 의왕시 맑은내길 6', '김김김', '16072', '경비실에 맡겨주세요', 'test'),
	(15, 0, '2020-04-16 12:11:58', 25500, 6, 0, 25494, 1, 255, '김민균', '01062990941', '서울 관악구 양녕로 5', '거기요', '08757', 'ㄴㅁㅇㅇㄴㅁㄻㄴㅇㄹ', 'test'),
	(16, 0, '2020-04-19 14:16:54', 19800, 0, 1, 22800, 1, 198, '김민균', '01062990941', '서울 관악구 양녕로 5', '거기요', '08757', 'ㄴㅁㅇㅇㄴㅁㄻㄴㅇㄹ', 'test'),
	(17, 0, '2020-04-22 22:45:05', 15000, 0, 1, 18000, 1, 150, '김민균', '01062990941', '서울 관악구 양녕로 5', '거기요', '08757', 'ㄴㅁㅇㅇㄴㅁㄻㄴㅇㄹ', 'test');
/*!40000 ALTER TABLE `orderlist` ENABLE KEYS */;

-- 테이블 getum.order_detail 구조 내보내기
CREATE TABLE IF NOT EXISTS `order_detail` (
  `od_no` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '주문내용_idx',
  `od_name` varchar(30) NOT NULL COMMENT '상품명',
  `od_quantity` smallint(5) unsigned NOT NULL COMMENT '주문수량',
  `od_price` int(10) unsigned NOT NULL COMMENT '상품가격',
  `od_status` tinyint(3) unsigned NOT NULL COMMENT '배송상태',
  `order_id` bigint(20) unsigned NOT NULL COMMENT '주문_idx',
  `p_uuid` char(33) NOT NULL COMMENT '상품_uuid',
  PRIMARY KEY (`od_no`),
  KEY `FK_product_TO_order_detail` (`p_uuid`),
  KEY `FK_orderlist_TO_order_detail` (`order_id`),
  CONSTRAINT `FK_orderlist_TO_order_detail` FOREIGN KEY (`order_id`) REFERENCES `orderlist` (`o_no`),
  CONSTRAINT `FK_product_TO_order_detail` FOREIGN KEY (`p_uuid`) REFERENCES `product` (`p_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COMMENT='주문내용';

-- 테이블 데이터 getum.order_detail:~24 rows (대략적) 내보내기
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` (`od_no`, `od_name`, `od_quantity`, `od_price`, `od_status`, `order_id`, `p_uuid`) VALUES
	(1, '늑대소년', 3, 13500, 0, 1, 'p6427e7c140a446fda5ff1ebde02ab272'),
	(2, '핑크핑크V', 4, 15600, 0, 2, 'p6a1575a4609e46d0ab432c86b718d43e'),
	(3, '매드캡', 3, 19300, 0, 2, 'p40db46e80730470a9fa00dc90fd38ae3'),
	(4, '마그나', 1, 11500, 0, 2, 'p840a2f7bf48640518178a2430a8e5ce3'),
	(5, '크림슨', 2, 19200, 0, 2, 'p7cb985109fc344209dcf7f8ba0351c57'),
	(6, '502 스댕', 30, 19800, 0, 3, 'p0754d61847e748d7bb62f1264a9af2f8'),
	(7, '마그나', 6, 11500, 0, 3, 'p840a2f7bf48640518178a2430a8e5ce3'),
	(8, '늑대소년', 4, 13500, 0, 3, 'p6427e7c140a446fda5ff1ebde02ab272'),
	(9, '502 스댕', 4, 19800, 0, 4, 'p0754d61847e748d7bb62f1264a9af2f8'),
	(10, '502 스댕', 2, 19800, 0, 5, 'p0754d61847e748d7bb62f1264a9af2f8'),
	(11, '매드캡', 1, 19300, 0, 6, 'p40db46e80730470a9fa00dc90fd38ae3'),
	(12, '핑크핑크V', 1, 15600, 0, 7, 'p6a1575a4609e46d0ab432c86b718d43e'),
	(13, '크림슨', 3, 19200, 0, 8, 'p7cb985109fc344209dcf7f8ba0351c57'),
	(14, '502 스댕', 4, 19800, 0, 9, 'p0754d61847e748d7bb62f1264a9af2f8'),
	(15, '늑대소년', 4, 13500, 0, 9, 'p6427e7c140a446fda5ff1ebde02ab272'),
	(16, '핑크핑크V', 1, 15600, 0, 10, 'p6a1575a4609e46d0ab432c86b718d43e'),
	(17, '매드캡', 2, 19300, 0, 11, 'p40db46e80730470a9fa00dc90fd38ae3'),
	(18, '502 스댕', 1, 19800, 0, 12, 'p0754d61847e748d7bb62f1264a9af2f8'),
	(19, '매드캡', 1, 19300, 0, 13, 'p40db46e80730470a9fa00dc90fd38ae3'),
	(20, '늑대소년', 1, 13500, 0, 14, 'p6427e7c140a446fda5ff1ebde02ab272'),
	(21, '젠틀맨', 1, 9900, 0, 15, 'p713a1f1d67ba4dd4bb1e14034ef0e743'),
	(22, '핑크핑크V', 1, 15600, 0, 15, 'p6a1575a4609e46d0ab432c86b718d43e'),
	(23, '502 스댕', 1, 19800, 0, 16, 'p0754d61847e748d7bb62f1264a9af2f8'),
	(24, '502샘플', 1, 15000, 0, 17, 'jab0b97b13259425f8faa18e1fa26ce93');
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;

-- 테이블 getum.point 구조 내보내기
CREATE TABLE IF NOT EXISTS `point` (
  `po_no` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '포인트_idx',
  `po_usesave_flag` tinyint(1) NOT NULL COMMENT '적립T/사용F',
  `po_point` int(10) unsigned NOT NULL COMMENT '포인트',
  `po_detail` varchar(50) NOT NULL COMMENT '내용',
  `po_date` datetime NOT NULL COMMENT '일시',
  `m_id` varchar(30) NOT NULL COMMENT '아이디',
  PRIMARY KEY (`po_no`),
  KEY `FK_member_TO_point` (`m_id`),
  CONSTRAINT `FK_member_TO_point` FOREIGN KEY (`m_id`) REFERENCES `member` (`m_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COMMENT='포인트';

-- 테이블 데이터 getum.point:~18 rows (대략적) 내보내기
/*!40000 ALTER TABLE `point` DISABLE KEYS */;
INSERT INTO `point` (`po_no`, `po_usesave_flag`, `po_point`, `po_detail`, `po_date`, `m_id`) VALUES
	(3, 1, 7170, '주문번호 :3 / 구매 적립', '2020-03-28 08:17:30', 'test'),
	(4, 1, 750, '주문번호 :4 / 구매 적립', '2020-03-28 08:17:56', 'test'),
	(5, 0, 4200, '주문번호 :4 / 포인트 사용', '2020-03-28 08:17:56', 'test'),
	(6, 1, 396, '주문번호 :5 / 구매 적립', '2020-03-30 02:31:53', 'moonkero'),
	(7, 1, 193, '주문번호 :6 / 구매 적립', '2020-03-30 02:31:59', 'moonkero'),
	(8, 1, 156, '주문번호 :7 / 구매 적립', '2020-03-30 12:36:35', 'test'),
	(9, 1, 576, '주문번호 :8 / 구매 적립', '2020-03-30 12:44:14', 'moonkero'),
	(10, 1, 1294, '주문번호 :9 / 구매 적립', '2020-03-31 10:32:56', 'test'),
	(11, 0, 3800, '주문번호 :9 / 포인트 사용', '2020-03-31 10:32:56', 'test'),
	(12, 1, 156, '주문번호 :10 / 구매 적립', '2020-04-10 10:35:05', 'test'),
	(13, 1, 386, '주문번호 :11 / 구매 적립', '2020-04-10 16:59:09', 'test'),
	(14, 1, 198, '주문번호 :12 / 구매 적립', '2020-04-10 18:00:51', 'test'),
	(15, 1, 193, '주문번호 :13 / 구매 적립', '2020-04-13 16:23:30', 'test'),
	(16, 1, 135, '주문번호 :14 / 구매 적립', '2020-04-14 14:25:26', 'test'),
	(18, 1, 255, '주문번호 :15 / 구매 적립', '2020-04-16 12:11:58', 'test'),
	(19, 0, 6, '주문번호 :15 / 포인트 사용', '2020-04-16 12:11:58', 'test'),
	(20, 1, 198, '주문번호 :16 / 구매 적립', '2020-04-19 14:16:54', 'test'),
	(21, 1, 150, '주문번호 :17 / 구매 적립', '2020-04-22 22:45:05', 'test');
/*!40000 ALTER TABLE `point` ENABLE KEYS */;

-- 테이블 getum.product 구조 내보내기
CREATE TABLE IF NOT EXISTS `product` (
  `p_uuid` char(33) NOT NULL COMMENT '상품_uuid',
  `p_name` varchar(30) NOT NULL COMMENT '상품명',
  `p_code` varchar(30) NOT NULL COMMENT '상품코드',
  `p_price` int(10) unsigned NOT NULL COMMENT '가격',
  `p_reg_date` datetime NOT NULL COMMENT '등록일',
  `p_release_date` date NOT NULL COMMENT '출시일',
  `p_manufacture` varchar(30) NOT NULL COMMENT '제조사',
  `p_detail` text NOT NULL COMMENT '설명',
  `p_stock` int(10) unsigned NOT NULL COMMENT '재고',
  `p_category` varchar(200) NOT NULL COMMENT '분류',
  `p_delete_flag` tinyint(1) NOT NULL COMMENT '삭제F',
  PRIMARY KEY (`p_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='상품';

-- 테이블 데이터 getum.product:~10 rows (대략적) 내보내기
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` (`p_uuid`, `p_name`, `p_code`, `p_price`, `p_reg_date`, `p_release_date`, `p_manufacture`, `p_detail`, `p_stock`, `p_category`, `p_delete_flag`) VALUES
	('jab0b97b13259425f8faa18e1fa26ce93', '502샘플', '502', 15000, '2020-04-16 11:58:36', '2020-04-16', '502', '샘플', 9998, '스테인리스,인기상품', 1),
	('p0754d61847e748d7bb62f1264a9af2f8', '502 스댕', 'ZF50201', 19800, '2020-03-20 00:00:00', '2020-03-27', '(주)GETUM', '상세설명', 9958, '신제품, 스테인리스', 0),
	('p40db46e80730470a9fa00dc90fd38ae3', '매드캡', 'ZD32232', 19300, '2012-05-05 00:00:00', '2020-03-27', '(주)델루나', '상세설명', 9893, '플라스틱', 0),
	('p6427e7c140a446fda5ff1ebde02ab272', '늑대소년', 'ZF50332', 13500, '2019-12-22 00:00:00', '2020-03-27', '(주)GETUM', '상세설명', 6988, '인기상품, 플라스틱', 0),
	('p6a1575a4609e46d0ab432c86b718d43e', '핑크핑크V', 'ZX11132', 15600, '2019-04-05 00:00:00', '2020-03-27', '(주)크래프트', '상세설명', 499, '인기상품, 스테인리스', 0),
	('p713a1f1d67ba4dd4bb1e14034ef0e743', '젠틀맨', 'ZS37732', 9900, '2019-03-12 00:00:00', '2020-03-27', '(주)서원유통', '상세설명', 5899, '플라스틱', 0),
	('p7cb985109fc344209dcf7f8ba0351c57', '크림슨', 'ZD32332', 19200, '2014-07-05 00:00:00', '2020-03-27', '(주)델루나', '상세설명', 9895, '스테인리스', 0),
	('p840a2f7bf48640518178a2430a8e5ce3', '마그나', 'ZS77775', 11500, '2015-12-17 00:00:00', '2020-03-27', '(주)서원유통', '상세설명', 9893, '스테인리스', 0),
	('paafd78945fff4bd59dd35eba929a936e', '리프카페', 'ZF50222', 16000, '2019-02-27 00:00:00', '2020-03-27', '(주)GETUM', '상세설명', 9000, '스테인리스', 0),
	('pf30eb9c4ce1e4ac59501ef3811048131', '502 RED', 'ZF50102', 14800, '2018-06-23 00:00:00', '2020-03-27', '(주)GETUM', '상세설명', 8000, '신제품, 인기상품, 플라스틱', 0);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
