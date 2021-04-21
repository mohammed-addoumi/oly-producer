DECLARE
    v_dml_type VARCHAR2(10);
    x_payload  VARCHAR2(32760) := '{';
                   
    cursor c is
    select * from olydev.fdbcpt
    order by CPCENT, CPRACI, CPGRE, CPRUB, CPMON;
    
    x_count   number :=  0;
    x_startdate date;
    x_enddate date;
    --
BEGIN

    v_dml_type := 'UPDATE';
    x_startdate := sysdate;  
    for rop in c
    loop
        
        x_payload := '{';

        x_payload := x_payload || DATA_CONS.p_s('cpnold', ROP.CPNOLD) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpdtld', ROP.CPDTLD) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cplild', ROP.CPLILD) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpproc', ROP.CPPROC) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpusuf', ROP.CPUSUF) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpnant', ROP.CPNANT) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpbloc', ROP.CPBLOC) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpcheq', ROP.CPCHEQ) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpechq', ROP.CPECHQ) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpbnma', ROP.CPBNMA) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpbnca', ROP.CPBNCA) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpcnds', ROP.CPCNDS) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpfil1', ROP.CPFIL1) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpgest', ROP.CPGEST) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpavop', ROP.CPAVOP) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpextj', ROP.CPEXTJ) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpatte', ROP.CPATTE) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpdres', ROP.CPDRES) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cprelv', ROP.CPRELV) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpechl', ROP.CPECHL) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpdre1', ROP.CPDRE1) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpdre2', ROP.CPDRE2) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpdre3', ROP.CPDRE3) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpdre4', ROP.CPDRE4) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpfil2', ROP.CPFIL2) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpfrrl', ROP.CPFRRL) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpfrec', ROP.CPFREC) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpcadr', ROP.CPCADR) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpstda', ROP.CPSTDA) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpstds', ROP.CPSTDS) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpbcal', ROP.CPBCAL) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpdvlt', ROP.CPDVLT) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpdcba', ROP.CPDCBA) || ',';

        x_payload := x_payload || DATA_CONS.p_d('cpdtba', ROP.CPDTBA) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpdsig', ROP.CPDSIG) || ',';

        x_payload := x_payload || DATA_CONS.p_d('cpdmar', ROP.CPDMAR) || ',';

        x_payload := x_payload || DATA_CONS.p_d('cpdeff', ROP.CPDEFF) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpccba', ROP.CPCCBA) || ',';

        x_payload := x_payload || DATA_CONS.p_d('cpctba', ROP.CPCTBA) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpcsig', ROP.CPCSIG) || ',';

        x_payload := x_payload || DATA_CONS.p_d('cpcmar', ROP.CPCMAR) || ',';

        x_payload := x_payload || DATA_CONS.p_d('cpceff', ROP.CPCEFF) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpccom', ROP.CPCCOM) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpcbcl', ROP.CPCBCL) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpavof', ROP.CPAVOF) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpechd', ROP.CPECHD) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpprif', ROP.CPPRIF) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpcofi', ROP.CPCOFI) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpcdor', ROP.CPCDOR) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpddor', ROP.CPDDOR) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpfavi', ROP.CPFAVI) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpfrel', ROP.CPFREL) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpfext', ROP.CPFEXT) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpfanu', ROP.CPFANU) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpfbcl', ROP.CPFBCL) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpfcog', ROP.CPFCOG) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpfcom', ROP.CPFCOM) || ',';

        x_payload := x_payload || DATA_CONS.p_d('cpsold', ROP.CPSOLD) || ',';

        x_payload := x_payload || DATA_CONS.p_d('cpsmlc', ROP.CPSMLC) || ',';

        x_payload := x_payload || DATA_CONS.p_d('cpslim', ROP.CPSLIM) || ',';

        x_payload := x_payload || DATA_CONS.p_l('cpdseq', ROP.CPDSEQ) || ',';

        x_payload := x_payload || DATA_CONS.p_l('cpdsqa', ROP.CPDSQA) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpdtdm', ROP.CPDTDM) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpdtdb', ROP.CPDTDB) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpdtar', ROP.CPDTAR) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpnmrj', ROP.CPNMRJ) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpnmrp', ROP.CPNMRP) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpnmrb', ROP.CPNMRB) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpnmrx', ROP.CPNMRX) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpdtev', ROP.CPDTEV) || ',';

        x_payload := x_payload || DATA_CONS.p_d('cpctmg', ROP.CPCTMG) || ',';

        x_payload := x_payload || DATA_CONS.p_d('cpctms', ROP.CPCTMS) || ',';

        x_payload := x_payload || DATA_CONS.p_d('cpsldp', ROP.CPSLDP) || ',';

        x_payload := x_payload || DATA_CONS.p_d('cpctrv', ROP.CPCTRV) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpplnt', ROP.CPPLNT) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpplnp', ROP.CPPLNP) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpamon', ROP.CPAMON) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cptycl', ROP.CPTYCL) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpnati', ROP.CPNATI) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpdomi', ROP.CPDOMI) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpacti', ROP.CPACTI) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpsect', ROP.CPSECT) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpdtbc', ROP.CPDTBC) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpdtb1', ROP.CPDTB1) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpdtb2', ROP.CPDTB2) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpcdbo', ROP.CPCDBO) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpimlt', ROP.CPIMLT) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpimlp', ROP.CPIMLP) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cplter', ROP.CPLTER) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpopev', ROP.CPOPEV) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpsimu', ROP.CPSIMU) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpopln', ROP.CPOPLN) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpnatc', ROP.CPNATC) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpdomr', ROP.CPDOMR) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpseqd', ROP.CPSEQD) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpmonl', ROP.CPMONL) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpmons', ROP.CPMONS) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpmong', ROP.CPMONG) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpddre', ROP.CPDDRE) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpcmre', ROP.CPCMRE) || ',';

        x_payload := x_payload || DATA_CONS.p_d('cpbollchf', ROP.CPBOLLCHF) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpdtboll', ROP.CPDTBOLL) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpcptrrlv', ROP.CPCPTRRLV) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpswrel', ROP.CPSWREL) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cptydis', ROP.CPTYDIS) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpdorac', ROP.CPDORAC) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpdorub', ROP.CPDORUB) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpplnti', ROP.CPPLNTI) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpraci', ROP.CPRACI) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpgre', ROP.CPGRE) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cprub', ROP.CPRUB) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpmon', ROP.CPMON) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpetat', ROP.CPETAT) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpdtou', ROP.CPDTOU) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpdtmu', ROP.CPDTMU) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpdtan', ROP.CPDTAN) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpnbrm', ROP.CPNBRM) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpoprn', ROP.CPOPRN) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpgera', ROP.CPGERA) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpcent', ROP.CPCENT) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cptrub', ROP.CPTRUB) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpacpt', ROP.CPACPT) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpnatu', ROP.CPNATU) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpfrbo', ROP.CPFRBO) || ',';

        x_payload := x_payload || DATA_CONS.p_d('cpmlim', ROP.CPMLIM) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpdvdu', ROP.CPDVDU) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpdvau', ROP.CPDVAU) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpfram', ROP.CPFRAM) || ',';

        x_payload := x_payload || DATA_CONS.p_d('cpmtam', ROP.CPMTAM) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpdtam', ROP.CPDTAM) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpcpti', ROP.CPCPTI) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpcptc', ROP.CPCPTC) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpcptf', ROP.CPCPTF) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpplnpi', ROP.CPPLNPI) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpcogui', ROP.CPCOGUI) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cptycoo', ROP.CPTYCOO) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpfill', ROP.CPFILL) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpcdng', ROP.CPCDNG) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpcadn', ROP.CPCADN) || ',';

        x_payload := x_payload || DATA_CONS.p_d('cpmghy', ROP.CPMGHY) || ',';

        x_payload := x_payload || DATA_CONS.p_d('cpmgti', ROP.CPMGTI) || ',';

        x_payload := x_payload || DATA_CONS.p_d('cpmgau', ROP.CPMGAU) || ',';

        x_payload := x_payload || DATA_CONS.p_d('cpmbla', ROP.CPMBLA) || ',';

        x_payload := x_payload || DATA_CONS.p_d('cpmbls', ROP.CPMBLS) || ',';

        x_payload := x_payload || DATA_CONS.p_d('cpghypm', ROP.CPGHYPM) || ',';

        x_payload := x_payload || DATA_CONS.p_d('cpgtitm', ROP.CPGTITM) || ',';

        x_payload := x_payload || DATA_CONS.p_d('cpgtita', ROP.CPGTITA) || ',';

        x_payload := x_payload || DATA_CONS.p_d('cpacoma', ROP.CPACOMA) || ',';

        x_payload := x_payload || DATA_CONS.p_d('cpscoma', ROP.CPSCOMA) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cplimc', ROP.CPLIMC) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpcnvsol', ROP.CPCNVSOL) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpcnvdatj', ROP.CPCNVDATJ) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpcnvmvt', ROP.CPCNVMVT) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpdtbo', ROP.CPDTBO) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpdtfqrv', ROP.CPDTFQRV) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpfrrev', ROP.CPFRREV) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpsymp', ROP.CPSYMP) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpdtdr', ROP.CPDTDR) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpnrel', ROP.CPNREL) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpdtpr', ROP.CPDTPR) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpdtir', ROP.CPDTIR) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpfinm', ROP.CPFINM) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpsupm', ROP.CPSUPM) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpfusion', ROP.CPFUSION) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cptcocp', ROP.CPTCOCP) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cptcomv', ROP.CPTCOMV) || ',';

        x_payload := x_payload || DATA_CONS.p_d('cpmcocp', ROP.CPMCOCP) || ',';

        x_payload := x_payload || DATA_CONS.p_d('cpmcomv', ROP.CPMCOMV) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpjred', ROP.CPJRED) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpfouv', ROP.CPFOUV) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpvspe', ROP.CPVSPE) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpclcpt', ROP.CPCLCPT) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpcliban', ROP.CPCLIBAN) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpclbanq', ROP.CPCLBANQ) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpgrpges', ROP.CPGRPGES) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cptseq', ROP.CPTSEQ) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpctrl', ROP.CPCTRL) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpctrllim', ROP.CPCTRLLIM) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpdamiva', ROP.CPDAMIVA) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cpfile', ROP.CPFILE);

        x_payload := x_payload || '}';

        INSERT INTO DATA_CONS.EVENT_HISTORY (ID, TABLE_NAME, ROW_ID, "TIMESTAMP", DML_COMMAND, EVENT_TYPE, PAYLOAD, TRANSACTION_ID, VERSION, STATUS)
        VALUES (DATA_CONS.EVENT_HISTORY_SEQ.nextval, 'FDBCPT', ROP.CPRACI||ROP.CPGRE||ROP.CPRUB||ROP.CPMON, sysdate, v_dml_type, 'FDBCPT_INSERT_OR_UPDATE', x_payload, '0','0.1.0', 'INITIATED');
        
        x_count := x_count + 1;
        --
        if mod(x_count, 1000) = 0 then
            commit;
        end if;
        --    
    end loop;
    --
    commit;
    --
    x_enddate := sysdate;
    
    dbms_output.put_line ('Transformed ' ||x_count || ' FDBCPT Records.');    
    dbms_output.put_line('Elapsed Time : ' || to_char(to_date('1970-01-01 00:00:00', 'yyyy-mm-dd hh24:mi:ss')+(x_enddate - x_startdate),'hh24:mi:ss'));                            
END;