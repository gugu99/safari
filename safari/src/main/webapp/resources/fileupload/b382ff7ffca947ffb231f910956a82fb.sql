SELECT
	b.board_no
	, b.work_no
	, b.board_title
	, b.board_content
	, b.board_location
	, b.board_detail_location
	, b.board_auth
	, b.board_fix
	, b.board_writer
	, b.board_create_date
	, b.writer_name
	, b.writer_filename
	, b.writer_file_ext
	, b.board_like_cnt
	
	, bf.board_file_no
	, bf.filename
	, bf.file_ext
	, bf.origin_name
	, bf.file_type
	, bf.file_size
	
	, bc.board_cmt_no
	, bc.board_cmt_content
	, bc.board_cmt_writer
	, bc.cmt_create_date	
	, bc.cmt_writer_name
	, bc.cmt_writer_filename
	, bc.cmt_writer_file_ext
FROM
	(
	SELECT
		b1.board_no
		, b1.work_no
		, b1.board_title
		, b1.board_content
		, b1.board_location
		, b1.board_detail_location
		, b1.board_auth
		, b1.board_fix
		, b1.board_writer
		, b1.board_create_date
		
		, b1.writer_name
		, b1.writer_filename
		, b1.writer_file_ext
		
		, bl.board_like_cnt
	FROM
		(
		SELECT
			b2.board_no
			, b2.work_no
			, b2.board_title
			, b2.board_content
			, b2.board_location
			, b2.board_detail_location
			, b2.board_auth
			, b2.board_fix
			, b2.board_writer
			, b2.create_date board_create_date
			
			, vwm1.work_member_name writer_name
			, vwm1.filename writer_filename
			, vwm1.file_ext writer_file_ext
		FROM
			board b2
		INNER JOIN
			v_workspace_member vwm1
		ON
			b2.board_writer = vwm1.work_member_email
		WHERE
			vwm1.work_no = 2
		) b1
	LEFT OUTER JOIN
		(
		SELECT
			board_no
			, COUNT(*) board_like_cnt
		FROM
			board_like
		GROUP BY
			board_no
		) bl
	ON
		b1.board_no = bl.board_no
	) b
LEFT OUTER JOIN
	board_file bf
ON
	b.board_no = bf.board_no
LEFT OUTER JOIN
	(
	SELECT
		bc1.board_cmt_no
		, bc1.board_no
		, bc1.board_cmt_content
		, bc1.board_cmt_writer
		, bc1.create_date cmt_create_date
		
		, vwm2.work_member_name cmt_writer_name
		, vwm2.filename cmt_writer_filename
		, vwm2.file_ext cmt_writer_file_ext
	FROM
		board_comment bc1
	INNER JOIN
		v_workspace_member vwm2
	ON
		bc1.board_cmt_writer = vwm2.work_member_email
	WHERE
		vwm2.work_no = 2
	) bc
ON
	b.board_no = bc.board_no
;	

select * from board;
select * from board_comment;
select * from board_like;
select * from board_file;
select * from v_workspace_member;
