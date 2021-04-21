DECLARE
    v_dml_type VARCHAR2(10);
    x_payload  VARCHAR2(32760) := '{';   

    cursor op is
    select * from olydev.fdbmvt
    --where   mvdtop >= '20150101'
    order by mvraci, mvgre, mvrub, mvmon, mvseqc;
    
    x_count   number :=  0;
    x_startdate date;
    x_enddate date;
    --
BEGIN

    v_dml_type := 'UPDATE';
    x_startdate := sysdate; 
    -- 
    for rop in op
    loop
        
        x_payload := '{';
                  
        x_payload := x_payload || DATA_CONS.p_s('mvraci', rop.MVRACI) || ',';

        x_payload := x_payload || DATA_CONS.p_s('mvgre', rop.MVGRE) || ',';

        x_payload := x_payload || DATA_CONS.p_s('mvrub', rop.MVRUB) || ',';

        x_payload := x_payload || DATA_CONS.p_s('mvmon', rop.MVMON) || ',';

        x_payload := x_payload || DATA_CONS.p_l('mvseqc', rop.MVSEQC) || ',';

        x_payload := x_payload || DATA_CONS.p_l('mvseqj', rop.MVSEQJ) || ',';

        x_payload := x_payload || DATA_CONS.p_l('mvidrs', rop.MVIDRS) || ',';

        x_payload := x_payload || DATA_CONS.p_l('mvnors', rop.MVNORS) || ',';

        x_payload := x_payload || DATA_CONS.p_l('mvoprt', rop.MVOPRT) || ',';

        x_payload := x_payload || DATA_CONS.p_l('mvecri', rop.MVECRI) || ',';

        x_payload := x_payload || DATA_CONS.p_l('mvdtop', rop.MVDTOP) || ',';

        x_payload := x_payload || DATA_CONS.p_l('mvdtva', rop.MVDTVA) || ',';

        x_payload := x_payload || DATA_CONS.p_l('mvdtrf', rop.MVDTRF) || ',';

        x_payload := x_payload || DATA_CONS.p_l('mvdtcf', rop.MVDTCF) || ',';

        x_payload := x_payload || DATA_CONS.p_l('mvdtsy', rop.MVDTSY) || ',';

        x_payload := x_payload || DATA_CONS.p_l('mvtmsy', rop.MVTMSY) || ',';

        x_payload := x_payload || DATA_CONS.p_l('mvclib', rop.MVCLIB) || ',';

        x_payload := x_payload || DATA_CONS.p_s('mvlib1', rop.MVLIB1) || ',';

        x_payload := x_payload || DATA_CONS.p_s('mvlib2', rop.MVLIB2) || ',';

        x_payload := x_payload || DATA_CONS.p_s('mvcnt2', rop.MVCNT2) || ',';

        x_payload := x_payload || DATA_CONS.p_s('mvsta2', rop.MVSTA2) || ',';

        x_payload := x_payload || DATA_CONS.p_s('mvflux', rop.MVFLUX) || ',';

        x_payload := x_payload || DATA_CONS.p_s('mvccou', rop.MVCCOU) || ',';

        x_payload := x_payload || DATA_CONS.p_s('mvvref', rop.MVVREF) || ',';

        x_payload := x_payload || DATA_CONS.p_l('mvrefo', rop.MVREFO) || ',';

        x_payload := x_payload || DATA_CONS.p_s('mvcext', rop.MVCEXT) || ',';

        x_payload := x_payload || DATA_CONS.p_d('mvmont', rop.MVMONT) || ',';

        x_payload := x_payload || DATA_CONS.p_d('mvmtml', rop.MVMTML) || ',';

        x_payload := x_payload || DATA_CONS.p_d('mvmtib', rop.MVMTIB) || ',';

        x_payload := x_payload || DATA_CONS.p_d('mvsold', rop.MVSOLD) || ',';

        x_payload := x_payload || DATA_CONS.p_d('mvsldv', rop.MVSLDV) || ',';

        x_payload := x_payload || DATA_CONS.p_d('mvsldr', rop.MVSLDR) || ',';

        x_payload := x_payload || DATA_CONS.p_l('mvoprn', rop.MVOPRN) || ',';

        x_payload := x_payload || DATA_CONS.p_l('mvcntp', rop.MVCNTP) || ',';

        x_payload := x_payload || DATA_CONS.p_l('mvemip', rop.MVEMIP) || ',';

        x_payload := x_payload || DATA_CONS.p_l('mvexep', rop.MVEXEP) || ',';

        x_payload := x_payload || DATA_CONS.p_l('mvrapp', rop.MVRAPP) || ',';

        x_payload := x_payload || DATA_CONS.p_l('mvcent', rop.MVCENT) || ',';

        x_payload := x_payload || DATA_CONS.p_s('mvsrcs', rop.MVSRCS) || ',';

        x_payload := x_payload || DATA_CONS.p_s('mvetat', rop.MVETAT) || ',';

        x_payload := x_payload || DATA_CONS.p_s('mvcrap', rop.MVCRAP) || ',';

        x_payload := x_payload || DATA_CONS.p_l('mvtope', rop.MVTOPE) || ',';

        x_payload := x_payload || DATA_CONS.p_s('mvibl1', rop.MVIBL1) || ',';

        x_payload := x_payload || DATA_CONS.p_s('mvibl2', rop.MVIBL2) || ',';

        x_payload := x_payload || DATA_CONS.p_s('mvcib1', rop.MVCIB1) || ',';

        x_payload := x_payload || DATA_CONS.p_s('mvcib2', rop.MVCIB2) || ',';

        x_payload := x_payload || DATA_CONS.p_s('mvsibl', rop.MVSIBL) || ',';

        x_payload := x_payload || DATA_CONS.p_s('mvnovl', rop.MVNOVL) || ',';

        x_payload := x_payload || DATA_CONS.p_s('mvmibl', rop.MVMIBL) || ',';

        x_payload := x_payload || DATA_CONS.p_s('mvcrac', rop.MVCRAC) || ',';

        x_payload := x_payload || DATA_CONS.p_s('mvcgre', rop.MVCGRE) || ',';

        x_payload := x_payload || DATA_CONS.p_s('mvcrub', rop.MVCRUB) || ',';

        x_payload := x_payload || DATA_CONS.p_s('mvcmon', rop.MVCMON) || ',';

        x_payload := x_payload || DATA_CONS.p_s('mvorio', rop.MVORIO) || ',';

        x_payload := x_payload || DATA_CONS.p_s('mvidrl', rop.MVIDRL) || ',';

        x_payload := x_payload || DATA_CONS.p_s('mvnorl', rop.MVNORL) || ',';

        x_payload := x_payload || DATA_CONS.p_s('mvorli', rop.MVORLI) || ',';

        x_payload := x_payload || DATA_CONS.p_s('mvconv', rop.MVCONV) || ',';

        x_payload := x_payload || DATA_CONS.p_s('mvfbde', rop.MVFBDE) || ',';

        x_payload := x_payload || DATA_CONS.p_s('mvseqt', rop.MVSEQT) || ',';

        x_payload := x_payload || DATA_CONS.p_d('mvctml', rop.MVCTML) || ',';

        x_payload := x_payload || DATA_CONS.p_d('mvctmc', rop.MVCTMC) || ',';

        x_payload := x_payload || DATA_CONS.p_s('mvmloc', rop.MVMLOC) || ',';

        x_payload := x_payload || DATA_CONS.p_s('mvmcli', rop.MVMCLI) || ',';

        x_payload := x_payload || DATA_CONS.p_d('mvchcp', rop.MVCHCP) || ',';

        x_payload := x_payload || DATA_CONS.p_d('mvchcl', rop.MVCHCL) || ',';

        x_payload := x_payload || DATA_CONS.p_d('mvchcr', rop.MVCHCR) || ',';

        x_payload := x_payload || DATA_CONS.p_s('mvvalr', rop.MVVALR) || ',';

        x_payload := x_payload || DATA_CONS.p_s('mvvals', rop.MVVALS) || ',';

        x_payload := x_payload || DATA_CONS.p_s('mvopbo', rop.MVOPBO) || ',';

        x_payload := x_payload || DATA_CONS.p_d('mvfrai', rop.MVFRAI) || ',';

        x_payload := x_payload || DATA_CONS.p_s('mvacti', rop.MVACTI) || ',';

        x_payload := x_payload || DATA_CONS.p_l('mvrefe', rop.MVREFE) || ',';

        x_payload := x_payload || DATA_CONS.p_s('mvtran', rop.MVTRAN) || ',';

        x_payload := x_payload || DATA_CONS.p_s('mvfias', rop.MVFIAS) || ',';

        x_payload := x_payload || DATA_CONS.p_s('mvfepu', rop.MVFEPU) || ',';

        x_payload := x_payload || DATA_CONS.p_s('mvfill', rop.MVFILL) || ',';

        x_payload := x_payload || DATA_CONS.p_s('mvextc', rop.MVEXTC) || ',';

        x_payload := x_payload || DATA_CONS.p_l('mvlpro', rop.MVLPRO) || ',';

        x_payload := x_payload || DATA_CONS.p_s('mvfil3', rop.MVFIL3);

        x_payload := x_payload || '}';

        INSERT /*+ APPEND */ INTO EVENT_HISTORY (ID, TABLE_NAME, ROW_ID, "TIMESTAMP", DML_COMMAND, EVENT_TYPE, PAYLOAD, TRANSACTION_ID, VERSION, STATUS)
        VALUES (EVENT_HISTORY_SEQ.nextval, 'FDBMVT', rop.mvraci||rop.mvgre||rop.mvrub||rop.mvmon||rop.mvseqc, sysdate, v_dml_type, 'FDBMVT_INSERT_OR_UPDATE', x_payload, '0','0.1.0', 'INITIATED');
        --
        x_count := x_count + 1;
        --
        if mod(x_count, 500) = 0 then
            commit;
        end if;
        --
    END LOOP;    
    --             
    commit;   
    --
    x_enddate := sysdate;
    
    dbms_output.put_line ('Transformed ' ||x_count || ' Records.');    
    dbms_output.put_line('Elapsed Time : ' || to_char(to_date('1970-01-01 00:00:00', 'yyyy-mm-dd hh24:mi:ss')+(x_enddate - x_startdate),'hh24:mi:ss'));
    --         
END;