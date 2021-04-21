CREATE OR REPLACE TRIGGER ER_FDBMVT_TR
    BEFORE INSERT OR UPDATE
    ON FDBMVT
    FOR EACH ROW
DECLARE
    v_dml_type VARCHAR2(10);
    x_payload VARCHAR2(32760) := '{';
BEGIN

    v_dml_type := CASE
                      WHEN INSERTING THEN 'INSERT'
                      WHEN UPDATING THEN 'UPDATE'
                  END;
      
      x_payload := x_payload || DATA_CONS.p_s('mvraci', :NEW.MVRACI) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('mvgre', :NEW.MVGRE) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('mvrub', :NEW.MVRUB) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('mvmon', :NEW.MVMON) || ',';
      
      x_payload := x_payload || DATA_CONS.p_l('mvseqc', :NEW.MVSEQC) || ',';
      
      x_payload := x_payload || DATA_CONS.p_l('mvseqj', :NEW.MVSEQJ) || ',';
      
      x_payload := x_payload || DATA_CONS.p_l('mvidrs', :NEW.MVIDRS) || ',';
      
      x_payload := x_payload || DATA_CONS.p_l('mvnors', :NEW.MVNORS) || ',';
      
      x_payload := x_payload || DATA_CONS.p_l('mvoprt', :NEW.MVOPRT) || ',';
      
      x_payload := x_payload || DATA_CONS.p_l('mvecri', :NEW.MVECRI) || ',';
      
      x_payload := x_payload || DATA_CONS.p_l('mvdtop', :NEW.MVDTOP) || ',';
      
      x_payload := x_payload || DATA_CONS.p_l('mvdtva', :NEW.MVDTVA) || ',';
      
      x_payload := x_payload || DATA_CONS.p_l('mvdtrf', :NEW.MVDTRF) || ',';
      
      x_payload := x_payload || DATA_CONS.p_l('mvdtcf', :NEW.MVDTCF) || ',';
      
      x_payload := x_payload || DATA_CONS.p_l('mvdtsy', :NEW.MVDTSY) || ',';
      
      x_payload := x_payload || DATA_CONS.p_l('mvtmsy', :NEW.MVTMSY) || ',';
      
      x_payload := x_payload || DATA_CONS.p_l('mvclib', :NEW.MVCLIB) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('mvlib1', :NEW.MVLIB1) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('mvlib2', :NEW.MVLIB2) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('mvcnt2', :NEW.MVCNT2) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('mvsta2', :NEW.MVSTA2) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('mvflux', :NEW.MVFLUX) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('mvccou', :NEW.MVCCOU) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('mvvref', :NEW.MVVREF) || ',';
      
      x_payload := x_payload || DATA_CONS.p_l('mvrefo', :NEW.MVREFO) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('mvcext', :NEW.MVCEXT) || ',';
      
      x_payload := x_payload || DATA_CONS.p_d('mvmont', :NEW.MVMONT) || ',';
      
      x_payload := x_payload || DATA_CONS.p_d('mvmtml', :NEW.MVMTML) || ',';
      
      x_payload := x_payload || DATA_CONS.p_d('mvmtib', :NEW.MVMTIB) || ',';
      
      x_payload := x_payload || DATA_CONS.p_d('mvsold', :NEW.MVSOLD) || ',';
      
      x_payload := x_payload || DATA_CONS.p_d('mvsldv', :NEW.MVSLDV) || ',';
      
      x_payload := x_payload || DATA_CONS.p_d('mvsldr', :NEW.MVSLDR) || ',';
      
      x_payload := x_payload || DATA_CONS.p_l('mvoprn', :NEW.MVOPRN) || ',';
      
      x_payload := x_payload || DATA_CONS.p_l('mvcntp', :NEW.MVCNTP) || ',';
      
      x_payload := x_payload || DATA_CONS.p_l('mvemip', :NEW.MVEMIP) || ',';
      
      x_payload := x_payload || DATA_CONS.p_l('mvexep', :NEW.MVEXEP) || ',';
      
      x_payload := x_payload || DATA_CONS.p_l('mvrapp', :NEW.MVRAPP) || ',';
      
      x_payload := x_payload || DATA_CONS.p_l('mvcent', :NEW.MVCENT) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('mvsrcs', :NEW.MVSRCS) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('mvetat', :NEW.MVETAT) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('mvcrap', :NEW.MVCRAP) || ',';
      
      x_payload := x_payload || DATA_CONS.p_l('mvtope', :NEW.MVTOPE) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('mvibl1', :NEW.MVIBL1) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('mvibl2', :NEW.MVIBL2) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('mvcib1', :NEW.MVCIB1) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('mvcib2', :NEW.MVCIB2) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('mvsibl', :NEW.MVSIBL) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('mvnovl', :NEW.MVNOVL) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('mvmibl', :NEW.MVMIBL) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('mvcrac', :NEW.MVCRAC) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('mvcgre', :NEW.MVCGRE) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('mvcrub', :NEW.MVCRUB) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('mvcmon', :NEW.MVCMON) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('mvorio', :NEW.MVORIO) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('mvidrl', :NEW.MVIDRL) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('mvnorl', :NEW.MVNORL) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('mvorli', :NEW.MVORLI) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('mvconv', :NEW.MVCONV) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('mvfbde', :NEW.MVFBDE) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('mvseqt', :NEW.MVSEQT) || ',';
      
      x_payload := x_payload || DATA_CONS.p_d('mvctml', :NEW.MVCTML) || ',';
      
      x_payload := x_payload || DATA_CONS.p_d('mvctmc', :NEW.MVCTMC) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('mvmloc', :NEW.MVMLOC) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('mvmcli', :NEW.MVMCLI) || ',';
      
      x_payload := x_payload || DATA_CONS.p_d('mvchcp', :NEW.MVCHCP) || ',';
      
      x_payload := x_payload || DATA_CONS.p_d('mvchcl', :NEW.MVCHCL) || ',';
      
      x_payload := x_payload || DATA_CONS.p_d('mvchcr', :NEW.MVCHCR) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('mvvalr', :NEW.MVVALR) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('mvvals', :NEW.MVVALS) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('mvopbo', :NEW.MVOPBO) || ',';
      
      x_payload := x_payload || DATA_CONS.p_d('mvfrai', :NEW.MVFRAI) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('mvacti', :NEW.MVACTI) || ',';
      
      x_payload := x_payload || DATA_CONS.p_l('mvrefe', :NEW.MVREFE) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('mvtran', :NEW.MVTRAN) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('mvfias', :NEW.MVFIAS) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('mvfepu', :NEW.MVFEPU) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('mvfill', :NEW.MVFILL) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('mvextc', :NEW.MVEXTC) || ',';
      
      x_payload := x_payload || DATA_CONS.p_l('mvlpro', :NEW.MVLPRO) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('mvfil3', :NEW.MVFIL3);
      
      x_payload := x_payload || '}';

    INSERT INTO DATA_CONS.EVENT_HISTORY (ID, TABLE_NAME, ROW_ID, "TIMESTAMP", DML_COMMAND, EVENT_TYPE, PAYLOAD, TRANSACTION_ID, VERSION, STATUS)
    VALUES (DATA_CONS.EVENT_HISTORY_SEQ.nextval, 'FDBMVT', :NEW.mvraci||:NEW.mvgre||:NEW.mvrub||:NEW.mvmon||:NEW.mvseqc, sysdate, v_dml_type,
            'FDBMVT_INSERT_OR_UPDATE', x_payload, '0','0.1.0', 'INITIATED');
END;
