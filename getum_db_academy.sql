-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        5.5.62 - MySQL Community Server (GPL)
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  10.3.0.5771
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- getum 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `getum` /*!40100 DEFAULT CHARACTER SET euckr */;
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=euckr COMMENT='배송지';

-- 테이블 데이터 getum.addr:~4 rows (대략적) 내보내기
/*!40000 ALTER TABLE `addr` DISABLE KEYS */;
INSERT INTO `addr` (`a_no`, `a_name`, `a_hp`, `a_addr1`, `a_addr2`, `a_post`, `a_request`, `a_default_flag`, `m_id`) VALUES
	(5, '구태형', '01061761861', '서울 도봉구 노해로 258', '삼성아파트 501동 1102호', '01453', '경비실에 맡겨주세요', 1, 'test'),
	(6, '박민서', '01062990941', '광주 남구 판촌길 23-4', '경리단길 52-3', '61763', '대문앞에 놔둬주세요', 0, 'test'),
	(14, 'test', '01062990941', '대전 동구 판교1길 3', 'test', '34672', 'test', 1, 'minkyun'),
	(15, '킹민균', '10943913832', '전남 장성군 서삼면 홍길동로 252-72', '1921', '57232', 'ㄴㅇㄹㄴㅇㄹ', 1, 'moonkero');
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=euckr COMMENT='공지사항';

-- 테이블 데이터 getum.board1_notice:~19 rows (대략적) 내보내기
/*!40000 ALTER TABLE `board1_notice` DISABLE KEYS */;
INSERT INTO `board1_notice` (`b1_idx`, `b1_subject`, `b1_content`, `b1_reg_date`, `b1_modify_date`, `b1_count`, `m_id`) VALUES
	(1, '제목', '내용', '1991-04-01 15:48:39', '2020-04-01 15:48:39', 4, 'admin'),
	(2, '제목2', '내용2', '1994-04-01 15:50:02', '2020-04-01 15:50:02', 1, 'admin'),
	(3, '제목3', '내용3', '1997-04-01 15:50:02', '2020-04-01 15:50:02', 2, 'admin'),
	(4, '제목4', '내용4', '2000-04-01 15:50:02', '2020-04-01 15:50:02', 1, 'admin'),
	(6, '제목6', '내용6', '2003-04-01 15:50:02', '2020-04-01 15:50:02', 2, 'admin'),
	(7, '제목7', '내용7', '2007-04-01 15:50:02', '2020-04-01 15:50:02', 1, 'admin'),
	(8, '제목8', '내용8', '2008-04-01 15:50:02', '2020-04-01 15:50:02', 1, 'admin'),
	(9, '[공지]온라인투어 실시간 항공_코로나19 사태로 인하여 현재 항공사들의 지속적인 단항/결항으로 항공권 취소 등의 문의', '[공지]온라인투어 실시간 항공_코로나19 사태로 인하여 현재 항공사들의 지속적인 단항/결항으로 항공권 취소 등의 문의', '2009-04-01 15:50:02', '2020-04-01 15:50:02', 2, 'admin'),
	(10, '[공지] 2019년 02월 ★편도특가★제주항공권 렌터카 이벤트 당첨안내', '[공지] 2019년 02월 ★편도특가★제주항공권 렌터카 이벤트 당첨안내', '2010-04-01 15:50:02', '2020-04-01 15:50:02', 3, 'admin'),
	(11, '[이벤트] 로켓배송5주년기념 \'나의 쿠팡이야기 수기공모전\'', '[이벤트] 로켓배송5주년기념 \'나의 쿠팡이야기 수기공모전\' 당첨자 발표', '2011-04-01 15:50:02', '2020-04-01 15:50:02', 6, 'admin'),
	(12, '[이벤트] 갤럭시 노트10 사전예약 쿠팡캐시 추첨 이벤트 당첨안내', '[이벤트] 갤럭시 노트10 사전예약 쿠팡캐시 추첨 이벤트 당첨안내', '2012-04-01 15:50:02', '2020-04-01 15:50:02', 6, 'admin'),
	(13, '추석맞이 로켓와우클럽 신규가입 이벤트 쿠팡캐시 당첨안내', '추석맞이 로켓와우클럽 신규가입 이벤트 쿠팡캐시 당첨안내', '2013-04-01 15:50:02', '2020-04-01 15:50:02', 4, 'admin'),
	(14, '2014 KCSI 소셜커머스 부문 2년 연속 1위 선정', '2014 KCSI 소셜커머스 부문 2년 연속 1위 선정', '2014-04-01 15:50:02', '2020-04-01 15:50:02', 7, 'admin'),
	(15, '쿠팡, 개인정보 대청소 캠페인', '쿠팡, 개인정보 대청소 캠페인', '2015-04-01 15:50:02', '2020-04-01 15:50:02', 11, 'admin'),
	(16, '1904 국가고객만족도(NCSI) 소셜커머스 부문 최초 9위 선정', '1904 국가고객만족도(NCSI) 소셜커머스 부문 최초 9위 선정', '2016-04-01 15:50:02', '2020-04-04 17:48:14', 15, 'admin'),
	(17, '[안내] 금융감독원 사칭 (쿠팡 사칭 포함) 악성코드 피해 주의 안내', '[안내] 금융감독원 사칭 (쿠팡 사칭 포함) 악성코드 피해 주의 안내', '2017-04-01 15:50:02', '2020-04-01 15:50:02', 9, 'admin'),
	(18, '[공지] 쿠팡캐시 사용 한도 제한 안내 ', '[공지] 쿠팡캐시 사용 한도 제한 안내 ', '2018-04-01 15:50:02', '2020-04-01 15:50:02', 9, 'admin'),
	(19, '[공지] 쿠팡 신한제휴카드, 쿠팡캐시 3% 무제한 적립 (연회비 면제)', '[공지] 쿠팡 신한제휴카드, 쿠팡캐시 3% 무제한 적립 (연회비 면제)', '2019-04-01 15:50:02', '2020-04-01 15:50:02', 12, 'admin'),
	(20, '[공지] 신종금융사기! 스미싱 주의바랍니다!!', '[공지] 신종금융사기! 스미싱 주의바랍니다!!', '2020-04-01 15:50:03', '2020-04-01 15:50:03', 13, 'admin');
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=euckr COMMENT='자유게시판';

-- 테이블 데이터 getum.board2_free:~15 rows (대략적) 내보내기
/*!40000 ALTER TABLE `board2_free` DISABLE KEYS */;
INSERT INTO `board2_free` (`b2_idx`, `b2_subject`, `b2_content`, `b2_reg_date`, `b2_modify_date`, `b2_count`, `b2_delete_flag`, `b2_origin`, `b2_origin_step`, `b2_origin_depth`, `m_id`) VALUES
	(1, 'test', 'test', '2020-04-06 14:15:22', '2020-04-06 14:15:23', 18, 0, 1, 0, 0, 'admin'),
	(2, 'test333', '3test', '2020-04-06 18:25:49', '2020-04-06 18:25:49', 4, 1, 2, 0, 0, 'test'),
	(3, 'tessdf2321', '123124', '2020-04-06 18:28:19', '2020-04-06 18:28:19', 21, 1, 3, 0, 0, 'test'),
	(4, '제가 한 번 수정해보겠습니다222', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam bibendum sem quis orci fermentum iaculis. Cras sed nibh eu nibh lobortis pretium eu quis nisi. Donec vitae massa enim. Phasellus lobortis vehicula ligula ac commodo. Etiam in arcu augue. Suspendisse tincidunt, magna id tempor dapibus, nulla lacus lacinia risus, id scelerisque ligula lorem sed dui. Aliquam venenatis sagittis tellus, ac placerat metus tincidunt sit amet. Aenean non purus nunc. Sed egestas felis nunc, sed tempor magna pellentesque et. Morbi ut magna hendrerit sem eleifend eleifend ut at magna.\r\n\r\nPraesent tincidunt fringilla metus. Vivamus in tempus est. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Aenean aliquet tristique est. Nam sapien massa, gravida a pulvinar vitae, vehicula eu eros. Suspendisse at consectetur lorem. Donec fermentum dui est, sed accumsan nulla faucibus a. Phasellus pellentesque, quam quis ultrices sollicitudin, lorem orci laoreet ligula, a tincidunt erat sapien sagittis nisl. Aenean ornare consequat dolor.\r\n\r\nUt fringilla nibh quis orci congue, iaculis bibendum tortor viverra. Mauris vitae massa mattis, facilisis justo id, maximus metus. Nunc nunc ipsum, accumsan eget aliquam et, aliquet id elit. Vivamus pulvinar gravida lectus, a placerat turpis bibendum eget. Duis quam ipsum, hendrerit a lobortis at, congue vitae turpis. Proin lobortis a ante ac cursus. Aliquam a efficitur ex. In in elementum urna. Cras molestie fringilla nisl, non facilisis turpis ornare quis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Integer vulputate orci eu lorem sollicitudin, ac gravida orci rutrum.\r\n\r\nVestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nam dapibus diam diam, vel elementum felis blandit nec. Nullam fringilla felis nulla, vel interdum sapien aliquet non. Duis pharetra efficitur massa eget ullamcorper. Morbi enim augue, tincidunt vel blandit vitae, hendrerit vitae neque. In hac habitasse platea dictumst. Pellentesque nec nunc libero. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas est eros, ornare sed porta sit amet, tincidunt vitae lorem. Interdum et malesuada fames ac ante ipsum primis in faucibus.\r\n\r\nNullam metus urna, malesuada vel magna quis, vehicula ullamcorper nunc. Nulla facilisi. Nunc eu consectetur urna. Cras faucibus vulputate quam malesuada cursus. Etiam lorem sem, fringilla in mauris id, venenatis dignissim eros. Donec varius elit et felis facilisis, non mollis sapien sagittis. Nulla facilisis arcu nec nibh congue, vel auctor orci tincidunt.', '2020-04-06 18:31:21', '2020-04-07 10:59:18', 26, 2, 4, 0, 0, 'test'),
	(5, '테스트으으', '테스트으으', '2020-04-06 18:55:17', '2020-04-06 18:55:17', 6, 0, 5, 0, 0, 'moonkero'),
	(6, '답글 테스트', '답글 테스트', '2020-04-06 19:01:32', '2020-04-06 19:01:32', 5, 0, 3, 1, 1, 'moonkero'),
	(7, '답글에 답글 테스트', '답글에 답글 테스트', '2020-04-06 19:12:28', '2020-04-06 19:12:28', 7, 0, 3, 2, 2, 'moonkero'),
	(8, '안녕하세요우', '반급습니다', '2020-04-06 19:13:24', '2020-04-06 19:13:24', 3, 0, 8, 0, 0, 'moonkero'),
	(9, '운영자님 하이루', '하이루', '2020-04-06 19:13:35', '2020-04-06 19:13:35', 0, 0, 1, 1, 1, 'moonkero'),
	(10, '잘되는거 같은데?', '올 ㅋ', '2020-04-06 19:13:43', '2020-04-06 19:13:43', 14, 0, 10, 0, 0, 'moonkero'),
	(11, '잘되는거 같니?', '응', '2020-04-06 19:14:03', '2020-04-06 19:14:03', 11, 0, 10, 1, 1, 'test'),
	(12, '답글에 답글에 답글', '답글에 답글에 답글', '2020-04-07 09:11:13', '2020-04-07 09:11:13', 1, 0, 3, 3, 3, 'test'),
	(13, 'ㅎ2ㅎ2', 'ㅎ2ㅎ2', '2020-04-07 11:56:45', '2020-04-07 11:56:45', 1, 0, 8, 1, 1, 'test'),
	(14, 'test11', 'test11', '2020-04-17 12:20:08', '2020-04-17 12:21:21', 3, 0, 14, 0, 0, 'test'),
	(15, 'test', 'test', '2020-04-17 15:25:31', '2020-04-17 15:25:31', 1, 0, 2, 1, 1, 'test');
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
) ENGINE=InnoDB DEFAULT CHARSET=euckr COMMENT='회원';

-- 테이블 데이터 getum.member:~6 rows (대략적) 내보내기
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` (`m_id`, `m_pwd`, `m_name`, `m_email`, `m_hp`, `m_point`, `m_join_date`, `m_birthday`, `m_grade`, `m_withdraw_flag`) VALUES
	('admin', '9c98cd448c63af6003185595a4c67b407f2a720c4e7698d348d7d77664fb5175', '관리자', 'admin@getum.com', '01011112222', 999999999, '2020-03-28 10:40:35', '2020-01-01', 255, 0),
	('minkyun', '7a1ba8fed98b70464b77ebe0a64d409b24ff77d0237b1bb54fa1a02407b226a7', '김민균', 'monghit123@naver.com', '01062990941', 1000, '2020-04-17 17:09:39', '1990-09-18', 0, 1),
	('moonkero', '7a1ba8fed98b70464b77ebe0a64d409b24ff77d0237b1bb54fa1a02407b226a7', '구태형', 'moonkero@naver.com', '01067274321', 1079199, '2020-03-27 19:19:24', '1988-11-17', 0, 0),
	('test', '7a1ba8fed98b70464b77ebe0a64d409b24ff77d0237b1bb54fa1a02407b226a7', '테스트', 'test@test.com', '01033334444', 2014, '2020-03-27 19:19:24', '1997-04-13', 0, 0),
	('test1', 'f8a98d81c8f2a9cc1c062f5516dc32670e6cc5c87123eaa68c65feaa7380f311', '김민균1', 'monghit123@naver.com', '01062990941', 1000, '2020-04-17 11:31:11', '1997-02-28', 0, 1),
	('testtest', 'f8a98d81c8f2a9cc1c062f5516dc32670e6cc5c87123eaa68c65feaa7380f311', '홍길동1', 'test@test.com', '01000000000', 1000, '2020-04-17 15:10:46', '1995-02-28', 0, 1);
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
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=euckr COMMENT='주문';

-- 테이블 데이터 getum.orderlist:~51 rows (대략적) 내보내기
/*!40000 ALTER TABLE `orderlist` DISABLE KEYS */;
INSERT INTO `orderlist` (`o_no`, `o_status`, `o_order_date`, `o_total_price`, `o_use_point`, `o_delivery_flag`, `o_payment`, `o_payment_method`, `o_add_point`, `o_name`, `o_hp`, `o_addr1`, `o_addr2`, `o_post`, `o_request`, `m_id`) VALUES
	(1, 0, '2020-03-27 19:25:11', 57900, 0, 1, 60900, 2, 579, '구태형', '01067274321', '서울 구로구 구로중앙로18길 59', '9999호', '08302', '부재 시 문 앞에 부탁드립니다', 'moonkero'),
	(2, 0, '2020-03-27 19:34:49', 46800, 0, 1, 49800, 2, 468, '구태형', '01067274321', '서울 구로구 구로중앙로18길 59', '9999호', '08302', '부재 시 문 앞에 부탁드립니다', 'moonkero'),
	(3, 0, '2020-03-27 19:49:18', 29100, 0, 1, 32100, 1, 291, '구태형', '01067274321', '서울 구로구 구로중앙로18길 59', '9999호', '08302', '부재 시 문 앞에 부탁드립니다', 'moonkero'),
	(4, 0, '2020-03-28 10:07:39', 13500, 0, 1, 16500, 2, 135, '홍길동', '01068286248', '전남 장성군 서삼면 홍길동로 252-72', '진짜있네', '57232', '홍길동입니다', 'test'),
	(5, 0, '2020-03-28 10:48:13', 38600, 0, 1, 41600, 1, 386, '홍길동', '01068286248', '전남 장성군 서삼면 홍길동로 252-72', '진짜있네', '57232', '홍길동입니다', 'test'),
	(6, 0, '2020-03-28 11:01:24', 59400, 0, 1, 59400, 3, 594, '홍길동', '01068286248', '전남 장성군 서삼면 홍길동로 252-72', '진짜있네', '57232', '홍길동입니다', 'test'),
	(7, 0, '2020-03-28 11:04:09', 38400, 0, 1, 38400, 1, 384, '구태형', '01067274321', '서울 구로구 구로중앙로18길 59', '9999호', '08302', '부재 시 문 앞에 부탁드립니다', 'moonkero'),
	(8, 0, '2020-03-28 11:06:04', 46800, 0, 0, 46800, 1, 468, '홍길동', '01068286248', '전남 장성군 서삼면 홍길동로 252-72', '진짜있네', '57232', '홍길동입니다', 'test'),
	(9, 0, '2020-03-28 11:09:09', 105600, 0, 0, 105600, 1, 1056, '홍길동', '01068286248', '전남 장성군 서삼면 홍길동로 252-72', '진짜있네', '57232', '홍길동입니다', 'test'),
	(10, 0, '2020-03-28 11:14:52', 144800, 0, 0, 144800, 2, 1448, '홍길동', '01068286248', '전남 장성군 서삼면 홍길동로 252-72', '진짜있네', '57232', '홍길동입니다', 'test'),
	(11, 0, '2020-03-28 11:15:58', 5588400, 0, 0, 5588400, 3, 55884, '구태형', '01067274321', '서울 구로구 구로중앙로18길 59', '9999호', '08302', '부재 시 문 앞에 부탁드립니다', 'moonkero'),
	(12, 0, '2020-03-28 11:22:49', 59400, 0, 0, 59400, 1, 594, '홍길동', '01068286248', '전남 장성군 서삼면 홍길동로 252-72', '진짜있네', '57232', '홍길동입니다', 'test'),
	(13, 0, '2020-03-28 11:23:41', 15600, 0, 1, 18600, 3, 156, '홍길동', '01068286248', '전남 장성군 서삼면 홍길동로 252-72', '진짜있네', '57232', '홍길동입니다', 'test'),
	(14, 0, '2020-03-28 12:43:37', 19800, 2800, 1, 22800, 2, 170, '홍길동', '01068286248', '전남 장성군 서삼면 홍길동로 252-72', '진짜있네', '57232', '홍길동입니다', 'test'),
	(15, 0, '2020-03-28 13:07:21', 15600, 3600, 1, 15000, 1, 120, '구태형', '01067274321', '서울 구로구 구로중앙로18길 59', '9999호', '08302', '부재 시 문 앞에 부탁드립니다', 'moonkero'),
	(16, 0, '2020-03-28 13:19:19', 78000, 8000, 0, 70000, 2, 700, '홍길동', '01068286248', '전남 장성군 서삼면 홍길동로 252-72', '진짜있네', '57232', '홍길동입니다', 'test'),
	(17, 0, '2020-03-28 13:20:26', 123600, 72700, 0, 50900, 2, 509, '홍길동', '01068286248', '전남 장성군 서삼면 홍길동로 252-72', '진짜있네', '57232', '홍길동입니다', 'test'),
	(18, 0, '2020-03-28 13:24:33', 56100, 0, 0, 56100, 1, 561, '홍길동', '01068286248', '전남 장성군 서삼면 홍길동로 252-72', '진짜있네', '57232', '홍길동입니다', 'test'),
	(19, 0, '2020-03-28 13:46:39', 19300, 22300, 1, 0, 1, 0, '홍길동', '01068286248', '전남 장성군 서삼면 홍길동로 252-72', '진짜있네', '57232', '홍길동입니다', 'test'),
	(20, 0, '2020-03-28 13:57:03', 9900, 12900, 1, 0, 1, 99, '홍길동', '01068286248', '전남 장성군 서삼면 홍길동로 252-72', '진짜있네', '57232', '홍길동입니다', 'test'),
	(21, 0, '2020-03-28 13:59:28', 1737000, 64898, 0, 1672102, 1, 16721, '홍길동', '01068286248', '전남 장성군 서삼면 홍길동로 252-72', '진짜있네', '57232', '홍길동입니다', 'test'),
	(22, 0, '2020-03-28 14:01:11', 96000, 10000, 0, 86000, 1, 860, '홍길동', '01068286248', '전남 장성군 서삼면 홍길동로 252-72', '진짜있네', '57232', '홍길동입니다', 'test'),
	(23, 0, '2020-03-28 16:14:12', 198000, 8000, 0, 190000, 2, 1900, '홍길동', '01068286248', '전남 장성군 서삼면 홍길동로 252-72', '진짜있네', '57232', '홍길동입니다', 'test'),
	(24, 0, '2020-03-28 16:34:16', 7920000, 0, 0, 7920000, 1, 79200, '구태형', '01067274321', '서울 구로구 구로중앙로18길 59', '9999호', '08302', '부재 시 문 앞에 부탁드립니다', 'moonkero'),
	(25, 0, '2020-03-28 17:02:44', 198000, 0, 0, 198000, 3, 1980, '홍길동', '01068286248', '전남 장성군 서삼면 홍길동로 252-72', '진짜있네', '57232', '홍길동입니다', 'test'),
	(26, 0, '2020-03-29 15:33:16', 68200, 0, 0, 68200, 2, 682, '홍길동', '01068286248', '전남 장성군 서삼면 홍길동로 252-72', '진짜있네', '57232', '홍길동입니다', 'test'),
	(27, 0, '2020-03-29 18:27:59', 78000, 0, 0, 78000, 2, 780, '홍길동', '01068286248', '전남 장성군 서삼면 홍길동로 252-72', '진짜있네', '57232', '홍길동입니다', 'test'),
	(28, 0, '2020-03-30 14:58:15', 34500, 0, 0, 34500, 2, 345, '홍길동', '01068286248', '전남 장성군 서삼면 홍길동로 252-72', '진짜있네', '57232', '홍길동입니다', 'test'),
	(29, 0, '2020-03-30 14:59:49', 102000, 0, 0, 102000, 1, 1020, '홍길동', '01068286248', '전남 장성군 서삼면 홍길동로 252-72', '진짜있네', '57232', '홍길동입니다', 'test'),
	(30, 0, '2020-03-30 15:01:57', 9900, 0, 1, 12900, 1, 99, '홍길동', '01068286248', '전남 장성군 서삼면 홍길동로 252-72', '진짜있네', '57232', '홍길동입니다', 'test'),
	(31, 0, '2020-03-30 15:16:16', 19800, 0, 1, 22800, 1, 198, '홍길동', '01068286248', '전남 장성군 서삼면 홍길동로 252-72', '진짜있네', '57232', '홍길동입니다', 'test'),
	(32, 0, '2020-03-30 15:28:16', 19800, 0, 1, 22800, 3, 198, '홍길동', '01068286248', '전남 장성군 서삼면 홍길동로 252-72', '진짜있네', '57232', '홍길동입니다', 'test'),
	(33, 0, '2020-03-30 15:33:58', 13500, 0, 1, 16500, 1, 135, '홍길동', '01068286248', '전남 장성군 서삼면 홍길동로 252-72', '진짜있네', '57232', '홍길동입니다', 'test'),
	(34, 0, '2020-03-30 15:34:29', 19800, 0, 1, 22800, 1, 198, '홍길동', '01068286248', '전남 장성군 서삼면 홍길동로 252-72', '진짜있네', '57232', '홍길동입니다', 'test'),
	(35, 0, '2020-03-30 15:37:54', 19300, 0, 1, 22300, 1, 193, '홍길동', '01068286248', '전남 장성군 서삼면 홍길동로 252-72', '진짜있네', '57232', '홍길동입니다', 'test'),
	(36, 0, '2020-03-30 20:16:45', 13500, 0, 1, 16500, 3, 135, '홍길동', '01068286248', '전남 장성군 서삼면 홍길동로 252-72', '진짜있네', '57232', '홍길동입니다', 'test'),
	(37, 0, '2020-03-30 20:19:22', 19300, 0, 1, 22300, 3, 193, '홍길동', '01068286248', '전남 장성군 서삼면 홍길동로 252-72', '진짜있네', '57232', '홍길동입니다', 'test'),
	(38, 0, '2020-03-30 20:20:36', 25000, 0, 0, 25000, 2, 250, '홍길동', '01068286248', '전남 장성군 서삼면 홍길동로 252-72', '진짜있네', '57232', '홍길동입니다', 'test'),
	(39, 0, '2020-03-30 20:24:33', 19300, 0, 1, 22300, 3, 193, '홍길동', '01068286248', '전남 장성군 서삼면 홍길동로 252-72', '진짜있네', '57232', '홍길동입니다', 'test'),
	(40, 0, '2020-03-30 20:24:41', 39600, 0, 0, 39600, 3, 396, '홍길동', '01068286248', '전남 장성군 서삼면 홍길동로 252-72', '진짜있네', '57232', '홍길동입니다', 'test'),
	(41, 0, '2020-03-30 20:25:13', 15600, 0, 1, 18600, 3, 156, '홍길동', '01068286248', '전남 장성군 서삼면 홍길동로 252-72', '진짜있네', '57232', '홍길동입니다', 'test'),
	(42, 0, '2020-03-30 20:27:21', 102000, 0, 0, 102000, 3, 1020, '홍길동', '01068286248', '전남 장성군 서삼면 홍길동로 252-72', '진짜있네', '57232', '홍길동입니다', 'test'),
	(43, 0, '2020-04-08 10:12:09', 19800, 0, 1, 22800, 1, 198, '홍길동', '01068286248', '전남 장성군 서삼면 홍길동로 252-72', '진짜있네', '57232', '홍길동입니다', 'test'),
	(44, 0, '2020-04-09 10:31:55', 19800, 0, 1, 22800, 3, 198, '홍길동', '01068286248', '전남 장성군 서삼면 홍길동로 252-72', '진짜있네', '57232', '홍길동입니다', 'test'),
	(45, 0, '2020-04-09 10:32:05', 19300, 0, 1, 22300, 3, 193, '홍길동', '01068286248', '전남 장성군 서삼면 홍길동로 252-72', '진짜있네', '57232', '홍길동입니다', 'test'),
	(46, 0, '2020-04-09 15:21:02', 19800, 0, 1, 22800, 1, 198, '홍길동', '01068286248', '전남 장성군 서삼면 홍길동로 252-72', '진짜있네', '57232', '홍길동입니다', 'test'),
	(47, 0, '2020-04-09 17:25:19', 19300, 0, 1, 22300, 1, 193, '홍길동', '01068286248', '전남 장성군 서삼면 홍길동로 252-72', '진짜있네', '57232', '홍길동입니다', 'test'),
	(48, 0, '2020-04-17 09:19:04', 85200, 0, 0, 85200, 2, 852, '다시한번', '01061761861', '서울 도봉구 노해로 258', '123', '01453', '아오 진짜', 'test'),
	(49, 0, '2020-04-17 09:19:25', 16000, 0, 1, 19000, 3, 160, '다시한번', '01061761861', '서울 도봉구 노해로 258', '123', '01453', '아오 진짜', 'test'),
	(50, 0, '2020-04-17 11:52:56', 19800, 0, 1, 22800, 1, 198, '구태형', '01061761861', '서울 도봉구 노해로 258', '삼성아파트 501동 1102호', '01453', '경비실에 맡겨주세요', 'test'),
	(51, 0, '2020-04-17 15:22:14', 67100, 7777, 0, 59323, 1, 593, '박민서', '01062990941', '광주 남구 판촌길 23-4', '경리단길 52-3', '61763', '대문앞에 놔둬주세요', 'test');
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
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=euckr COMMENT='주문내용';

-- 테이블 데이터 getum.order_detail:~70 rows (대략적) 내보내기
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` (`od_no`, `od_name`, `od_quantity`, `od_price`, `od_status`, `order_id`, `p_uuid`) VALUES
	(1, '매드캡', 3, 19300, 0, 1, 'p40db46e80730470a9fa00dc90fd38ae3'),
	(2, '핑크핑크V', 3, 15600, 0, 2, 'p6a1575a4609e46d0ab432c86b718d43e'),
	(3, '젠틀맨', 1, 9900, 0, 3, 'p713a1f1d67ba4dd4bb1e14034ef0e743'),
	(4, '크림슨', 1, 19200, 0, 3, 'p7cb985109fc344209dcf7f8ba0351c57'),
	(5, '늑대소년', 1, 13500, 0, 4, 'p6427e7c140a446fda5ff1ebde02ab272'),
	(6, '매드캡', 2, 19300, 0, 5, 'p40db46e80730470a9fa00dc90fd38ae3'),
	(7, '502 스댕', 3, 19800, 0, 6, 'p0754d61847e748d7bb62f1264a9af2f8'),
	(8, '크림슨', 2, 19200, 0, 7, 'p7cb985109fc344209dcf7f8ba0351c57'),
	(9, '핑크핑크V', 3, 15600, 0, 8, 'p6a1575a4609e46d0ab432c86b718d43e'),
	(10, '리프카페', 3, 16000, 0, 9, 'paafd78945fff4bd59dd35eba929a936e'),
	(11, '크림슨', 3, 19200, 0, 9, 'p7cb985109fc344209dcf7f8ba0351c57'),
	(12, '502 스댕', 2, 19800, 0, 10, 'p0754d61847e748d7bb62f1264a9af2f8'),
	(13, '502 RED', 4, 14800, 0, 10, 'pf30eb9c4ce1e4ac59501ef3811048131'),
	(14, '마그나', 4, 11500, 0, 10, 'p840a2f7bf48640518178a2430a8e5ce3'),
	(15, '핑크핑크V', 333, 15600, 0, 11, 'p6a1575a4609e46d0ab432c86b718d43e'),
	(16, '리프카페', 21, 16000, 0, 11, 'paafd78945fff4bd59dd35eba929a936e'),
	(17, '크림슨', 3, 19200, 0, 11, 'p7cb985109fc344209dcf7f8ba0351c57'),
	(18, '502 스댕', 3, 19800, 0, 12, 'p0754d61847e748d7bb62f1264a9af2f8'),
	(19, '핑크핑크V', 1, 15600, 0, 13, 'p6a1575a4609e46d0ab432c86b718d43e'),
	(20, '502 스댕', 1, 19800, 0, 14, 'p0754d61847e748d7bb62f1264a9af2f8'),
	(21, '핑크핑크V', 1, 15600, 0, 15, 'p6a1575a4609e46d0ab432c86b718d43e'),
	(22, '502 스댕', 2, 19800, 0, 16, 'p0754d61847e748d7bb62f1264a9af2f8'),
	(23, '크림슨', 2, 19200, 0, 16, 'p7cb985109fc344209dcf7f8ba0351c57'),
	(24, '핑크핑크V', 3, 15600, 0, 17, 'p6a1575a4609e46d0ab432c86b718d43e'),
	(25, '크림슨', 4, 19200, 0, 17, 'p7cb985109fc344209dcf7f8ba0351c57'),
	(26, '핑크핑크V', 1, 15600, 0, 18, 'p6a1575a4609e46d0ab432c86b718d43e'),
	(27, '늑대소년', 3, 13500, 0, 18, 'p6427e7c140a446fda5ff1ebde02ab272'),
	(29, '매드캡', 1, 19300, 0, 19, 'p40db46e80730470a9fa00dc90fd38ae3'),
	(30, '젠틀맨', 1, 9900, 0, 20, 'p713a1f1d67ba4dd4bb1e14034ef0e743'),
	(31, '매드캡', 90, 19300, 0, 21, 'p40db46e80730470a9fa00dc90fd38ae3'),
	(32, '크림슨', 5, 19200, 0, 22, 'p7cb985109fc344209dcf7f8ba0351c57'),
	(33, '502 스댕', 10, 19800, 0, 23, 'p0754d61847e748d7bb62f1264a9af2f8'),
	(34, '502 스댕', 400, 19800, 0, 24, 'p0754d61847e748d7bb62f1264a9af2f8'),
	(35, '502 스댕', 10, 19800, 0, 25, 'p0754d61847e748d7bb62f1264a9af2f8'),
	(36, '젠틀맨', 1, 9900, 0, 26, 'p713a1f1d67ba4dd4bb1e14034ef0e743'),
	(37, '502 스댕', 1, 19800, 0, 26, 'p0754d61847e748d7bb62f1264a9af2f8'),
	(38, '매드캡', 1, 19300, 0, 26, 'p40db46e80730470a9fa00dc90fd38ae3'),
	(39, '크림슨', 1, 19200, 0, 26, 'p7cb985109fc344209dcf7f8ba0351c57'),
	(40, '502 스댕', 2, 19800, 0, 27, 'p0754d61847e748d7bb62f1264a9af2f8'),
	(41, '크림슨', 2, 19200, 0, 27, 'p7cb985109fc344209dcf7f8ba0351c57'),
	(42, '마그나', 3, 11500, 0, 28, 'p840a2f7bf48640518178a2430a8e5ce3'),
	(43, '502 RED', 3, 14800, 0, 29, 'pf30eb9c4ce1e4ac59501ef3811048131'),
	(44, '크림슨', 3, 19200, 0, 29, 'p7cb985109fc344209dcf7f8ba0351c57'),
	(45, '젠틀맨', 1, 9900, 0, 30, 'p713a1f1d67ba4dd4bb1e14034ef0e743'),
	(46, '502 스댕', 1, 19800, 0, 31, 'p0754d61847e748d7bb62f1264a9af2f8'),
	(47, '502 스댕', 1, 19800, 0, 32, 'p0754d61847e748d7bb62f1264a9af2f8'),
	(48, '늑대소년', 1, 13500, 0, 33, 'p6427e7c140a446fda5ff1ebde02ab272'),
	(49, '502 스댕', 1, 19800, 0, 34, 'p0754d61847e748d7bb62f1264a9af2f8'),
	(50, '매드캡', 1, 19300, 0, 35, 'p40db46e80730470a9fa00dc90fd38ae3'),
	(51, '늑대소년', 1, 13500, 0, 36, 'p6427e7c140a446fda5ff1ebde02ab272'),
	(52, '매드캡', 1, 19300, 0, 37, 'p40db46e80730470a9fa00dc90fd38ae3'),
	(53, '마그나', 1, 11500, 0, 38, 'p840a2f7bf48640518178a2430a8e5ce3'),
	(54, '늑대소년', 1, 13500, 0, 38, 'p6427e7c140a446fda5ff1ebde02ab272'),
	(55, '매드캡', 1, 19300, 0, 39, 'p40db46e80730470a9fa00dc90fd38ae3'),
	(56, '502 스댕', 2, 19800, 0, 40, 'p0754d61847e748d7bb62f1264a9af2f8'),
	(57, '핑크핑크V', 1, 15600, 0, 41, 'p6a1575a4609e46d0ab432c86b718d43e'),
	(58, '502 RED', 3, 14800, 0, 42, 'pf30eb9c4ce1e4ac59501ef3811048131'),
	(59, '크림슨', 3, 19200, 0, 42, 'p7cb985109fc344209dcf7f8ba0351c57'),
	(60, '502 스댕', 1, 19800, 0, 43, 'p0754d61847e748d7bb62f1264a9af2f8'),
	(61, '502 스댕', 1, 19800, 0, 44, 'p0754d61847e748d7bb62f1264a9af2f8'),
	(62, '매드캡', 1, 19300, 0, 45, 'p40db46e80730470a9fa00dc90fd38ae3'),
	(63, '502 스댕', 1, 19800, 0, 46, 'p0754d61847e748d7bb62f1264a9af2f8'),
	(64, '매드캡', 1, 19300, 0, 47, 'p40db46e80730470a9fa00dc90fd38ae3'),
	(65, '핑크핑크V', 3, 15600, 0, 48, 'p6a1575a4609e46d0ab432c86b718d43e'),
	(66, '크림슨', 2, 19200, 0, 48, 'p7cb985109fc344209dcf7f8ba0351c57'),
	(67, '리프카페', 1, 16000, 0, 49, 'paafd78945fff4bd59dd35eba929a936e'),
	(68, '502 스댕', 1, 19800, 0, 50, 'p0754d61847e748d7bb62f1264a9af2f8'),
	(69, 'test', 2, 20000, 0, 51, 'p1e30b6cfb824483ca929d4b5d6484e0f'),
	(70, '핑크핑크V', 1, 15600, 0, 51, 'p6a1575a4609e46d0ab432c86b718d43e'),
	(71, '마그나', 1, 11500, 0, 51, 'p840a2f7bf48640518178a2430a8e5ce3');
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
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=euckr COMMENT='포인트';

-- 테이블 데이터 getum.point:~46 rows (대략적) 내보내기
/*!40000 ALTER TABLE `point` DISABLE KEYS */;
INSERT INTO `point` (`po_no`, `po_usesave_flag`, `po_point`, `po_detail`, `po_date`, `m_id`) VALUES
	(18, 1, 509, '주문번호 :17 / 구매 적립', '2020-03-28 13:20:26', 'test'),
	(19, 0, 72700, '주문번호 :17 / 포인트 사용', '2020-03-28 13:20:26', 'test'),
	(20, 1, 561, '주문번호 :18 / 구매 적립', '2020-03-28 13:24:33', 'test'),
	(21, 0, 22300, '주문번호 :0 / 포인트 사용', '2020-03-28 13:34:22', 'moonkero'),
	(22, 1, 0, '주문번호 :19 / 구매 적립', '2020-03-28 13:46:39', 'test'),
	(23, 0, 22300, '주문번호 :19 / 포인트 사용', '2020-03-28 13:46:39', 'test'),
	(24, 1, 99, '주문번호 :20 / 구매 적립', '2020-03-28 13:57:03', 'test'),
	(25, 0, 12900, '주문번호 :20 / 포인트 사용', '2020-03-28 13:57:03', 'test'),
	(26, 1, 16721, '주문번호 :21 / 구매 적립', '2020-03-28 13:59:28', 'test'),
	(27, 0, 64898, '주문번호 :21 / 포인트 사용', '2020-03-28 13:59:28', 'test'),
	(28, 1, 860, '주문번호 :22 / 구매 적립', '2020-03-28 14:01:11', 'test'),
	(29, 0, 10000, '주문번호 :22 / 포인트 사용', '2020-03-28 14:01:11', 'test'),
	(30, 1, 1900, '주문번호 :23 / 구매 적립', '2020-03-28 16:14:12', 'test'),
	(31, 0, 8000, '주문번호 :23 / 포인트 사용', '2020-03-28 16:14:12', 'test'),
	(32, 1, 79200, '주문번호 :24 / 구매 적립', '2020-03-28 16:34:16', 'moonkero'),
	(33, 1, 1980, '주문번호 :25 / 구매 적립', '2020-03-28 17:02:44', 'test'),
	(34, 1, 682, '주문번호 :26 / 구매 적립', '2020-03-29 15:33:16', 'test'),
	(35, 1, 780, '주문번호 :27 / 구매 적립', '2020-03-29 18:27:59', 'test'),
	(36, 1, 345, '주문번호 :28 / 구매 적립', '2020-03-30 14:58:15', 'test'),
	(37, 1, 1020, '주문번호 :29 / 구매 적립', '2020-03-30 14:59:49', 'test'),
	(38, 1, 99, '주문번호 :30 / 구매 적립', '2020-03-30 15:01:57', 'test'),
	(39, 1, 198, '주문번호 :31 / 구매 적립', '2020-03-30 15:16:16', 'test'),
	(40, 1, 198, '주문번호 :32 / 구매 적립', '2020-03-30 15:28:16', 'test'),
	(41, 1, 135, '주문번호 :33 / 구매 적립', '2020-03-30 15:33:58', 'test'),
	(42, 1, 198, '주문번호 :34 / 구매 적립', '2020-03-30 15:34:29', 'test'),
	(43, 1, 193, '주문번호 :35 / 구매 적립', '2020-03-30 15:37:54', 'test'),
	(44, 1, 135, '주문번호 :36 / 구매 적립', '2020-03-30 20:16:45', 'test'),
	(45, 1, 193, '주문번호 :37 / 구매 적립', '2020-03-30 20:19:22', 'test'),
	(46, 1, 250, '주문번호 :38 / 구매 적립', '2020-03-30 20:20:36', 'test'),
	(47, 1, 193, '주문번호 :39 / 구매 적립', '2020-03-30 20:24:33', 'test'),
	(48, 1, 396, '주문번호 :40 / 구매 적립', '2020-03-30 20:24:41', 'test'),
	(49, 1, 156, '주문번호 :41 / 구매 적립', '2020-03-30 20:25:13', 'test'),
	(50, 1, 1020, '주문번호 :42 / 구매 적립', '2020-03-30 20:27:21', 'test'),
	(51, 1, 198, '주문번호 :43 / 구매 적립', '2020-04-08 10:12:09', 'test'),
	(52, 1, 198, '주문번호 :44 / 구매 적립', '2020-04-09 10:31:55', 'test'),
	(53, 1, 193, '주문번호 :45 / 구매 적립', '2020-04-09 10:32:05', 'test'),
	(56, 1, 198, '주문번호 :46 / 구매 적립', '2020-04-09 15:21:02', 'test'),
	(57, 1, 193, '주문번호 :47 / 구매 적립', '2020-04-09 17:25:19', 'test'),
	(58, 1, 852, '주문번호 :48 / 구매 적립', '2020-04-17 09:19:04', 'test'),
	(59, 1, 160, '주문번호 :49 / 구매 적립', '2020-04-17 09:19:25', 'test'),
	(60, 1, 1000, '회원가입 축하 적립금', '2020-04-17 11:31:11', 'test1'),
	(61, 1, 198, '주문번호 :50 / 구매 적립', '2020-04-17 11:52:56', 'test'),
	(62, 1, 1000, '회원가입 축하 적립금', '2020-04-17 15:10:46', 'testtest'),
	(63, 1, 593, '주문번호 :51 / 구매 적립', '2020-04-17 15:22:14', 'test'),
	(64, 0, 7777, '주문번호 :51 / 포인트 사용', '2020-04-17 15:22:14', 'test'),
	(65, 1, 1000, '회원가입 축하 적립금', '2020-04-17 17:09:39', 'minkyun');
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
) ENGINE=InnoDB DEFAULT CHARSET=euckr COMMENT='상품';

-- 테이블 데이터 getum.product:~10 rows (대략적) 내보내기
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` (`p_uuid`, `p_name`, `p_code`, `p_price`, `p_reg_date`, `p_release_date`, `p_manufacture`, `p_detail`, `p_stock`, `p_category`, `p_delete_flag`) VALUES
	('p0754d61847e748d7bb62f1264a9af2f8', '502 스댕', 'ZF50201', 19800, '2020-03-20 00:00:00', '2020-03-27', '(주)GETUM', '상세설명', 496, '신제품, 스테인리스', 0),
	('p1e30b6cfb824483ca929d4b5d6484e0f', 'test', 'test', 20000, '2020-04-17 15:14:40', '2020-04-10', 'test', 'test', 7775, '스테인리스,신제품', 0),
	('p40db46e80730470a9fa00dc90fd38ae3', '매드캡', 'ZD32232', 19300, '2012-05-05 00:00:00', '2020-03-27', '(주)델루나', '상세설명', 9797, '플라스틱', 0),
	('p6427e7c140a446fda5ff1ebde02ab272', '늑대소년', 'ZF50332', 13500, '2019-12-22 00:00:00', '2020-03-27', '(주)GETUM', '상세설명', 6993, '인기상품, 플라스틱', 0),
	('p6a1575a4609e46d0ab432c86b718d43e', '핑크핑크V', 'ZX11132', 15600, '2019-04-05 00:00:00', '2020-03-27', '(주)크래프트', '상세설명', 499, '인기상품, 스테인리스', 0),
	('p713a1f1d67ba4dd4bb1e14034ef0e743', '젠틀맨', 'ZS37732', 9900, '2019-03-12 00:00:00', '2020-03-27', '(주)서원유통', '상세설명', 5896, '플라스틱', 0),
	('p7cb985109fc344209dcf7f8ba0351c57', '크림슨', 'ZD32332', 19200, '2014-07-05 00:00:00', '2020-03-27', '(주)델루나', '상세설명', 9869, '스테인리스', 0),
	('p840a2f7bf48640518178a2430a8e5ce3', '마그나', 'ZS77775', 11500, '2015-12-17 00:00:00', '2020-03-27', '(주)서원유통', '상세설명', 9891, '스테인리스', 0),
	('paafd78945fff4bd59dd35eba929a936e', '리프카페', 'ZF50222', 16000, '2019-02-27 00:00:00', '2020-03-27', '(주)GETUM', '상세설명', 8975, '스테인리스', 0),
	('pf30eb9c4ce1e4ac59501ef3811048131', '502 RED', 'ZF50102', 14800, '2018-06-23 00:00:00', '2020-03-27', '(주)GETUM', '상세설명', 7990, '신제품, 인기상품, 플라스틱', 0);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
