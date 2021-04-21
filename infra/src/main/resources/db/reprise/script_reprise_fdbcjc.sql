DECLARE
    cursor op is
    select * from olydev.fdbcjc;
    
    v_dml_type VARCHAR2(10);
    x_payload VARCHAR2(32760) := '{';
    
    x_count   number :=  0;
    x_startdate date;
    x_enddate date;
    
BEGIN    

    v_dml_type := 'UPDATE';
    x_startdate := sysdate;    
    
    for rop in op
    loop
        x_payload := x_payload ||  DATA_CONS.p_s('cjcseq', ROP.CJCSEQ)  || ',' ;
        x_payload := x_payload ||  DATA_CONS.p_s('cjcsqu', ROP.CJCSQU)  || ',' ;
        x_payload := x_payload ||  DATA_CONS.p_s('cjccope', ROP.CJCCOPE)  || ',' ;
        x_payload := x_payload ||  DATA_CONS.p_s('cjcnope', ROP.CJCNOPE)  || ',' ;
        x_payload := x_payload ||  DATA_CONS.p_s('cjcbope', ROP.CJCBOPE)  || ',' ;
        x_payload := x_payload ||  DATA_CONS.p_s('cjceven', ROP.CJCEVEN)  || ',' ;
        x_payload := x_payload ||  DATA_CONS.p_s('cjcext', ROP.CJCEXT)  || ',' ;
        x_payload := x_payload ||  DATA_CONS.p_s('cjcont', ROP.CJCONT)  || ',' ;
        x_payload := x_payload ||  DATA_CONS.p_s('cjcst', ROP.CJCST)  || ',' ;
        x_payload := x_payload ||  DATA_CONS.p_s('cjcdsys', ROP.CJCDSYS)  || ',' ;
        x_payload := x_payload ||  DATA_CONS.p_s('cjctsys', ROP.CJCTSYS)  || ',' ;
        x_payload := x_payload ||  DATA_CONS.p_s('cjcope', ROP.CJCOPE)  || ',' ;
        x_payload := x_payload ||  DATA_CONS.p_s('cjcdct', ROP.CJCDCT)  || ',' ;
        x_payload := x_payload ||  DATA_CONS.p_s('cjchcnt', ROP.CJCHCNT)  || ',' ;
        x_payload := x_payload ||  DATA_CONS.p_s('cjcopect', ROP.CJCOPECT)  || ',' ;
        x_payload := x_payload ||  DATA_CONS.p_s('cjcde', ROP.CJCDE)  || ',' ;
        x_payload := x_payload ||  DATA_CONS.p_s('cjche', ROP.CJCHE)  || ',' ;
        x_payload := x_payload ||  DATA_CONS.p_s('cjcopee', ROP.CJCOPEE)  || ',' ;
        x_payload := x_payload ||  DATA_CONS.p_s('cjccer', ROP.CJCCER)  || ',' ;
        x_payload := x_payload ||  DATA_CONS.p_s('cjcfill', ROP.CJCFILL)  || ',' ;
        x_payload := x_payload ||  DATA_CONS.p_s('cjcctop', ROP.CJCCTOP)  || ',' ;
        x_payload := x_payload ||  DATA_CONS.p_s('cjcintc', ROP.CJCINTC)  || ',' ;
        x_payload := x_payload ||  DATA_CONS.p_s('cjcrac', ROP.CJCRAC)  || ',' ;
        x_payload := x_payload ||  DATA_CONS.p_s('cjcgenre', ROP.CJCGENRE)  || ',' ;
        x_payload := x_payload ||  DATA_CONS.p_s('cjcrub', ROP.CJCRUB)  || ',' ;
        x_payload := x_payload ||  DATA_CONS.p_s('cjcmonnaie', ROP.CJCMONNAIE)  || ',' ;
        x_payload := x_payload ||  DATA_CONS.p_s('cjcnatcpt', ROP.CJCNATCPT)  || ',' ;
        x_payload := x_payload ||  DATA_CONS.p_s('cjcnatrac', ROP.CJCNATRAC)  || ',' ;
        x_payload := x_payload ||  DATA_CONS.p_s('cjcnats', ROP.CJCNATS)  || ',' ;
        x_payload := x_payload ||  DATA_CONS.p_s('cjcrefc', ROP.CJCREFC)  || ',' ;
        x_payload := x_payload ||   DATA_CONS.p_d('cjcmont', ROP.CJCMONT)  || ',' ;
        x_payload := x_payload ||   DATA_CONS.p_d('cjccom', ROP.CJCCOM)  || ',' ;
        x_payload := x_payload ||   DATA_CONS.p_d('cjcintht', ROP.CJCINTHT)  || ',' ;
        x_payload := x_payload ||   DATA_CONS.p_d('cjcmonttva', ROP.CJCMONTTVA)  || ',' ;
        x_payload := x_payload ||   DATA_CONS.p_d('cjctvarec', ROP.CJCTVAREC)  || ',' ;
        x_payload := x_payload ||   DATA_CONS.p_d('cjctvact', ROP.CJCTVACT)  || ',' ;
        x_payload := x_payload ||   DATA_CONS.p_d('cjcmontip', ROP.CJCMONTIP)  || ',' ;
        x_payload := x_payload ||  DATA_CONS.p_s('cjcfill2', ROP.CJCFILL2) ;
        x_payload := x_payload || '}';    
          
        INSERT INTO EVENT_HISTORY (ID, TABLE_NAME, ROW_ID, "TIMESTAMP", DML_COMMAND, EVENT_TYPE, PAYLOAD, TRANSACTION_ID, VERSION, STATUS)
        VALUES (EVENT_HISTORY_SEQ.nextval, 'FDBCJC', ROP.CJCSEQ||ROP.CJCSQU, sysdate, v_dml_type, 'FDBCJC_INSERT_OR_UPDATE', x_payload, '0','0.1.0', 'INITIATED');
        --
        x_count := x_count + 1;
        --
        if mod(x_count, 1000) = 0 then
            commit;
        end if;
            --
    END LOOP;    
    --
    commit;
    --
    x_enddate := sysdate;
    
    dbms_output.put_line ('Transformed ' ||x_count || ' BPOS_SECACCOUNTRECORD_ Records.');    
    dbms_output.put_line('Elapsed Time : ' || to_char(to_date('1970-01-01 00:00:00', 'yyyy-mm-dd hh24:mi:ss')+(x_enddate - x_startdate),'hh24:mi:ss'));            
END;