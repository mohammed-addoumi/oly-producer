CREATE OR REPLACE TRIGGER ER_FDBCPT_TR
    BEFORE INSERT OR UPDATE
    ON FDBCPT
    FOR EACH ROW
DECLARE
    v_dml_type VARCHAR2(10);
    x_payload VARCHAR2(32760) := '{';
BEGIN

    v_dml_type := CASE
                      WHEN INSERTING THEN 'INSERT'
                      WHEN UPDATING THEN 'UPDATE'
                  END;
      
      x_payload := x_payload || DATA_CONS.p_s('cpnold', :NEW.CPNOLD) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpdtld', :NEW.CPDTLD) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cplild', :NEW.CPLILD) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpproc', :NEW.CPPROC) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpusuf', :NEW.CPUSUF) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpnant', :NEW.CPNANT) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpbloc', :NEW.CPBLOC) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpcheq', :NEW.CPCHEQ) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpechq', :NEW.CPECHQ) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpbnma', :NEW.CPBNMA) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpbnca', :NEW.CPBNCA) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpcnds', :NEW.CPCNDS) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpfil1', :NEW.CPFIL1) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpgest', :NEW.CPGEST) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpavop', :NEW.CPAVOP) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpextj', :NEW.CPEXTJ) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpatte', :NEW.CPATTE) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpdres', :NEW.CPDRES) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cprelv', :NEW.CPRELV) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpechl', :NEW.CPECHL) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpdre1', :NEW.CPDRE1) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpdre2', :NEW.CPDRE2) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpdre3', :NEW.CPDRE3) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpdre4', :NEW.CPDRE4) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpfil2', :NEW.CPFIL2) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpfrrl', :NEW.CPFRRL) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpfrec', :NEW.CPFREC) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpcadr', :NEW.CPCADR) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpstda', :NEW.CPSTDA) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpstds', :NEW.CPSTDS) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpbcal', :NEW.CPBCAL) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpdvlt', :NEW.CPDVLT) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpdcba', :NEW.CPDCBA) || ',';
      
      x_payload := x_payload || DATA_CONS.p_d('cpdtba', :NEW.CPDTBA) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpdsig', :NEW.CPDSIG) || ',';
      
      x_payload := x_payload || DATA_CONS.p_d('cpdmar', :NEW.CPDMAR) || ',';
      
      x_payload := x_payload || DATA_CONS.p_d('cpdeff', :NEW.CPDEFF) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpccba', :NEW.CPCCBA) || ',';
      
      x_payload := x_payload || DATA_CONS.p_d('cpctba', :NEW.CPCTBA) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpcsig', :NEW.CPCSIG) || ',';
      
      x_payload := x_payload || DATA_CONS.p_d('cpcmar', :NEW.CPCMAR) || ',';
      
      x_payload := x_payload || DATA_CONS.p_d('cpceff', :NEW.CPCEFF) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpccom', :NEW.CPCCOM) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpcbcl', :NEW.CPCBCL) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpavof', :NEW.CPAVOF) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpechd', :NEW.CPECHD) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpprif', :NEW.CPPRIF) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpcofi', :NEW.CPCOFI) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpcdor', :NEW.CPCDOR) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpddor', :NEW.CPDDOR) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpfavi', :NEW.CPFAVI) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpfrel', :NEW.CPFREL) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpfext', :NEW.CPFEXT) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpfanu', :NEW.CPFANU) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpfbcl', :NEW.CPFBCL) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpfcog', :NEW.CPFCOG) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpfcom', :NEW.CPFCOM) || ',';
      
      x_payload := x_payload || DATA_CONS.p_d('cpsold', :NEW.CPSOLD) || ',';
      
      x_payload := x_payload || DATA_CONS.p_d('cpsmlc', :NEW.CPSMLC) || ',';
      
      x_payload := x_payload || DATA_CONS.p_d('cpslim', :NEW.CPSLIM) || ',';
      
      x_payload := x_payload || DATA_CONS.p_l('cpdseq', :NEW.CPDSEQ) || ',';
      
      x_payload := x_payload || DATA_CONS.p_l('cpdsqa', :NEW.CPDSQA) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpdtdm', :NEW.CPDTDM) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpdtdb', :NEW.CPDTDB) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpdtar', :NEW.CPDTAR) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpnmrj', :NEW.CPNMRJ) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpnmrp', :NEW.CPNMRP) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpnmrb', :NEW.CPNMRB) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpnmrx', :NEW.CPNMRX) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpdtev', :NEW.CPDTEV) || ',';
      
      x_payload := x_payload || DATA_CONS.p_d('cpctmg', :NEW.CPCTMG) || ',';
      
      x_payload := x_payload || DATA_CONS.p_d('cpctms', :NEW.CPCTMS) || ',';
      
      x_payload := x_payload || DATA_CONS.p_d('cpsldp', :NEW.CPSLDP) || ',';
      
      x_payload := x_payload || DATA_CONS.p_d('cpctrv', :NEW.CPCTRV) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpplnt', :NEW.CPPLNT) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpplnp', :NEW.CPPLNP) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpamon', :NEW.CPAMON) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cptycl', :NEW.CPTYCL) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpnati', :NEW.CPNATI) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpdomi', :NEW.CPDOMI) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpacti', :NEW.CPACTI) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpsect', :NEW.CPSECT) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpdtbc', :NEW.CPDTBC) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpdtb1', :NEW.CPDTB1) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpdtb2', :NEW.CPDTB2) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpcdbo', :NEW.CPCDBO) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpimlt', :NEW.CPIMLT) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpimlp', :NEW.CPIMLP) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cplter', :NEW.CPLTER) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpopev', :NEW.CPOPEV) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpsimu', :NEW.CPSIMU) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpopln', :NEW.CPOPLN) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpnatc', :NEW.CPNATC) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpdomr', :NEW.CPDOMR) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpseqd', :NEW.CPSEQD) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpmonl', :NEW.CPMONL) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpmons', :NEW.CPMONS) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpmong', :NEW.CPMONG) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpddre', :NEW.CPDDRE) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpcmre', :NEW.CPCMRE) || ',';
      
      x_payload := x_payload || DATA_CONS.p_d('cpbollchf', :NEW.CPBOLLCHF) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpdtboll', :NEW.CPDTBOLL) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpcptrrlv', :NEW.CPCPTRRLV) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpswrel', :NEW.CPSWREL) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cptydis', :NEW.CPTYDIS) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpdorac', :NEW.CPDORAC) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpdorub', :NEW.CPDORUB) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpplnti', :NEW.CPPLNTI) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpraci', :NEW.CPRACI) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpgre', :NEW.CPGRE) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cprub', :NEW.CPRUB) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpmon', :NEW.CPMON) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpetat', :NEW.CPETAT) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpdtou', :NEW.CPDTOU) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpdtmu', :NEW.CPDTMU) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpdtan', :NEW.CPDTAN) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpnbrm', :NEW.CPNBRM) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpoprn', :NEW.CPOPRN) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpgera', :NEW.CPGERA) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpcent', :NEW.CPCENT) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cptrub', :NEW.CPTRUB) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpacpt', :NEW.CPACPT) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpnatu', :NEW.CPNATU) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpfrbo', :NEW.CPFRBO) || ',';
      
      x_payload := x_payload || DATA_CONS.p_d('cpmlim', :NEW.CPMLIM) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpdvdu', :NEW.CPDVDU) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpdvau', :NEW.CPDVAU) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpfram', :NEW.CPFRAM) || ',';
      
      x_payload := x_payload || DATA_CONS.p_d('cpmtam', :NEW.CPMTAM) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpdtam', :NEW.CPDTAM) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpcpti', :NEW.CPCPTI) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpcptc', :NEW.CPCPTC) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpcptf', :NEW.CPCPTF) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpplnpi', :NEW.CPPLNPI) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpcogui', :NEW.CPCOGUI) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cptycoo', :NEW.CPTYCOO) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpfill', :NEW.CPFILL) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpcdng', :NEW.CPCDNG) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpcadn', :NEW.CPCADN) || ',';
      
      x_payload := x_payload || DATA_CONS.p_d('cpmghy', :NEW.CPMGHY) || ',';
      
      x_payload := x_payload || DATA_CONS.p_d('cpmgti', :NEW.CPMGTI) || ',';
      
      x_payload := x_payload || DATA_CONS.p_d('cpmgau', :NEW.CPMGAU) || ',';
      
      x_payload := x_payload || DATA_CONS.p_d('cpmbla', :NEW.CPMBLA) || ',';
      
      x_payload := x_payload || DATA_CONS.p_d('cpmbls', :NEW.CPMBLS) || ',';
      
      x_payload := x_payload || DATA_CONS.p_d('cpghypm', :NEW.CPGHYPM) || ',';
      
      x_payload := x_payload || DATA_CONS.p_d('cpgtitm', :NEW.CPGTITM) || ',';
      
      x_payload := x_payload || DATA_CONS.p_d('cpgtita', :NEW.CPGTITA) || ',';
      
      x_payload := x_payload || DATA_CONS.p_d('cpacoma', :NEW.CPACOMA) || ',';
      
      x_payload := x_payload || DATA_CONS.p_d('cpscoma', :NEW.CPSCOMA) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cplimc', :NEW.CPLIMC) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpcnvsol', :NEW.CPCNVSOL) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpcnvdatj', :NEW.CPCNVDATJ) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpcnvmvt', :NEW.CPCNVMVT) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpdtbo', :NEW.CPDTBO) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpdtfqrv', :NEW.CPDTFQRV) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpfrrev', :NEW.CPFRREV) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpsymp', :NEW.CPSYMP) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpdtdr', :NEW.CPDTDR) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpnrel', :NEW.CPNREL) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpdtpr', :NEW.CPDTPR) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpdtir', :NEW.CPDTIR) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpfinm', :NEW.CPFINM) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpsupm', :NEW.CPSUPM) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpfusion', :NEW.CPFUSION) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cptcocp', :NEW.CPTCOCP) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cptcomv', :NEW.CPTCOMV) || ',';
      
      x_payload := x_payload || DATA_CONS.p_d('cpmcocp', :NEW.CPMCOCP) || ',';
      
      x_payload := x_payload || DATA_CONS.p_d('cpmcomv', :NEW.CPMCOMV) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpjred', :NEW.CPJRED) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpfouv', :NEW.CPFOUV) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpvspe', :NEW.CPVSPE) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpclcpt', :NEW.CPCLCPT) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpcliban', :NEW.CPCLIBAN) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpclbanq', :NEW.CPCLBANQ) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpgrpges', :NEW.CPGRPGES) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cptseq', :NEW.CPTSEQ) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpctrl', :NEW.CPCTRL) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpctrllim', :NEW.CPCTRLLIM) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpdamiva', :NEW.CPDAMIVA) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cpfile', :NEW.CPFILE);
      
      x_payload := x_payload || '}';


    INSERT INTO DATA_CONS.EVENT_HISTORY (ID, TABLE_NAME, ROW_ID, "TIMESTAMP", DML_COMMAND, EVENT_TYPE, PAYLOAD, TRANSACTION_ID, VERSION, STATUS)
    VALUES (DATA_CONS.EVENT_HISTORY_SEQ.nextval, 'FDBCPT', :NEW.cpraci||:NEW.cpgre||:NEW.cprub||:NEW.cpmon, sysdate, v_dml_type, 'FDBCPT_INSERT_OR_UPDATE', x_payload, '0','0.1.0', 'INITIATED');
END;