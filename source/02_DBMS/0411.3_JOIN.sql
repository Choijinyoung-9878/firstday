-- [ III ] JOIN :: 테이블 2개 이상을 연결하여 검색
SELECT * FROM EMP WHERE ENAME = 'SCOTT';  -- 부서번호(DEPTNO 20)
SELECT * FROM DEPT;
-- CROSS JOIN ( 단순하게 FROM절에 테이블을 2개 넣는것 EMP, DEPT
SELECT * FROM EMP, DEPT WHERE ENAME = 'SCOTT';
-------------------1 * 4 

SELECT * FROM EMP, DEPT;  -- 14 * 4 = 56 행

-------------------- ★ 1. EQUI JOIN  (  동등 조인 : 공통필드 DEPTNO 값이 일치되는 조건 JOIN) 
SELECT * FROM EMP, DEPT WHERE ENAME = 'SCOTT' AND EMP.DEPTNO = DEPT.DEPTNO;
SELECT * FROM EMP, DEPT WHERE EMP.DEPTNO = DEPT.DEPTNO;

SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, EMP.DEPTNO, DNAME, LOC FROM EMP, DEPT
    WHERE EMP.DEPTNO = DEPT.DEPTNO;
    --   사번, 이름, 직업, MGR, 입사일, 월급, 상여, EMP의 사번, DEPT의 이름, 근무지 FROM EMP, DEPT
    --  조건은 EMP.DEPTNO와 DEPT.DEPTNO 가 같은것들만
    -- WHERE ( JOIN 조건) 
    
        -- 테이블의 별칭
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, E.DEPTNO, DNAME, LOC
    FROM EMP E, DEPT D   -- 테이블의 별칭 
        WHERE E.DEPTNO = D.DEPTNO;
        
        -- ex. 급여가 2000 이상인 직원의 이름, 직책(job), 급여, 부서명, 근무지 출력
SELECT ENAME, JOB, SAL, DNAME, LOC FROM EMP E , DEPT D 
    WHERE E.DEPTNO = D.DEPTNO AND SAL >= 2000;

        -- ex. LOC이 'CHICAGO'인 사람의 이름, 업무, 급여, 부서번호, 근무지를 출력
SELECT ENAME, JOB, SAL, D.DEPTNO, LOC 
    FROM EMP E, DEPT D WHERE E.DEPTNO = D.DEPTNO AND LOC = 'CHICAGO';
    
        -- ex. 부서번호 10이거나 20번인 사원의 이름, 업무, 근무지, 급여. (급여순 정렬)
SELECT ENAME, JOB, LOC, SAL 
    FROM EMP E , DEPT D 
     WHERE E.DEPTNO = D.DEPTNO AND E.DEPTNO IN (10,20)
        ORDER BY SAL;
        
        -- ex. JOB이 SALESMAN이거나 MANAGER인 사원의 이름, 급여, 상여, 연봉 ((SAL + COMM)*12), 부서명
            -- 근무지를 출력(연봉이 높은 순으로 정렬)
SELECT ENAME, SAL, COMM, ((SAL+NVL(COMM,0))*12) 연봉 , DNAME, LOC 
    FROM EMP E, DEPT D
        WHERE E.DEPTNO = D.DEPTNO AND JOB IN ( 'SALESMAN', ' MANAGER' ) ORDER BY 연봉 DESC;
        -- ex. COMM이 NULL이고 급여가 1200 이상인 사원의 이름, 급여, 입사일, 부서번호, 부서명 출력
                -- (부서명 순, 급여 큰순 정렬)
SELECT ENAME, SAL, HIREDATE, E.DEPTNO, DNAME 
    FROM EMP E, DEPT D
        WHERE E.DEPTNO = D.DEPTNO AND COMM IS NULL AND SAL >= 1200
            ORDER BY DNAME, SAL DESC;
        -- ex. 'NEW YORK'에서 근무하는 사원의 이름과 급여 출력
SELECT ENAME, SAL 
    FROM EMP E, DEPT D 
        WHERE E.DEPTNO = D.DEPTNO AND LOC = 'NEW YORK';
        -- ex. 'ACCOUNTING' 부서 소속의 사원 이름과 입사일 출력
SELECT ENAME, HIREDATE
    FROM EMP E, DEPT D
        WHERE E.DEPTNO = D.DEPTNO AND DNAME = 'ACCOUNTING';
        --ex. 직급(job)이 MANAGER인 사원의 이름, 부서명 출력
SELECT ENAME, DNAME
    FROM EMP E, DEPT D
        WHERE E.DEPTNO = D.DEPTNO AND JOB = 'MANAGER';
        --ex. COMM이 NULL이 아닌 사원의 이름, 급여, 부서번호, 근무지 출력
SELECT ENAME, SAL, E.DEPTNO , LOC
    FROM EMP E, DEPT D
        WHERE E.DEPTNO = D.DEPTNO AND NOT COMM  IS NULL;
        

 --  ★ 2. NON-EQUI JOIN
 SELECT * FROM EMP WHERE ENAME = 'SCOTT';  --  사원정보
 SELECT * FROM SALGRADE; -- 급여 등급 정보
 -- CROSS JOIN = EMP의 1행 * SALGRADE의 5행
SELECT * FROM EMP, SALGRADE WHERE ENAME = 'SCOTT';  

SELECT * FROM EMP, SALGRADE
    WHERE SAL BETWEEN LOSAL AND HISAL;
SELECT * FROM EMP, SALGRADE          -- 위나 아래나 똑같음 
    WHERE SAL >= LOSAL AND SAL <= HISAL;

        -- ex. 모든 사원의 사번, 이름 , job, 상사 사번, 급여, 급여등급 (1등급, 2등급, ...)
SELECT EMPNO, ENAME, JOB, MGR, SAL, GRADE || '등급' GRADE
    FROM EMP, SALGRADE 
        WHERE SAL BETWEEN LOSAL AND HISAL;

-- ?	탄탄다지기 연습문제
--	 0번 Comm이 null이 아닌 사원의 이름, 급여, 등급, 부서번호, 부서이름, 근무지를 출력하시오.
SELECT ENAME, SAL, GRADE, D.DEPTNO, DNAME, LOC
    FROM EMP E, SALGRADE , DEPT D
        WHERE SAL BETWEEN LOSAL AND HISAL 
            AND E.DEPTNO = D.DEPTNO
                AND NOT COMM IS NULL;
--	1번 이름, 급여, 입사일, 급여등급
SELECT ENAME, SAL, HIREDATE, GRADE
    FROM EMP, SALGRADE
        WHERE SAL BETWEEN LOSAL AND HISAL;
        
--	2번 이름, 급여, 입사일, 급여등급, 부서명, 근무지
SELECT ENAME, SAL, HIREDATE, GRADE, DNAME, LOC
    FROM EMP E , DEPT D, SALGRADE
        WHERE SAL BETWEEN LOSAL AND HISAL
            AND E.DEPTNO = D.DEPTNO;
            
-- 3번 이름, 급여, 등급, 부서코드, 근무지. 단 comm 이 null아닌 경우
SELECT ENAME, SAL, GRADE, E.DEPTNO, LOC
    FROM EMP E, DEPT D, SALGRADE
        WHERE E.DEPTNO = D.DEPTNO
            AND SAL BETWEEN LOSAL AND HISAL
                AND NOT COMM IS NULL;
                
--	4번 이름, 급여, 급여등급, 연봉, 부서명, 부서별 출력, 부서가 같으면 연봉순. 연봉=(sal+comm)*12 comm이 null이면 0
SELECT ENAME, SAL, GRADE, (SAL + NVL(COMM,0))*12 연봉 , DNAME
    FROM EMP E, DEPT D, SALGRADE
        WHERE E.DEPTNO = D.DEPTNO
            AND SAL BETWEEN LOSAL AND HISAL
                ORDER BY DNAME, 연봉 ;
                
--	5번 이름, 업무, 급여, 등급, 부서코드, 부서명 출력. 급여가 1000~3000사이. 정렬조건 : 부서별, 부서같으면 업무별, 업무같으면 급여 큰순
SELECT ENAME, JOB, SAL, GRADE, E.DEPTNO, DNAME
    FROM EMP E, DEPT D, SALGRADE
        WHERE E.DEPTNO = D.DEPTNO AND SAL BETWEEN LOSAL AND HISAL
            AND SAL BETWEEN 1000 AND 3000
                ORDER BY DNAME, JOB, SAL DESC;
                
--	6번 이름, 급여, 등급, 입사일, 근무지. 81년에 입사한 사람. 등급 큰순
SELECT ENAME, SAL, GRADE, HIREDATE, LOC
    FROM EMP E, DEPT D, SALGRADE
        WHERE E.DEPTNO = D.DEPTNO
            AND SAL BETWEEN LOSAL AND HISAL
                AND HIREDATE LIKE '%81%'
                    ORDER BY GRADE DESC
                    ;
SELECT * FROM EMP, DEPT;
-- ★ 3. SELF JOIN
SELECT EMPNO 사번, ENAME 이름, MGR FROM EMP WHERE ENAME = 'SMITH';    -- SMITH 상사사번 : 7902
SELECT EMPNO, ENAME FROM EMP WHERE EMPNO= 7920;

SELECT WORKER.EMPNO, WORKER.ENAME, WORKER.MGR, MANAGER.EMPNO 상사사번, MANAGER.ENAME 상사이름 
        FROM EMP WORKER, EMP MANAGER
            WHERE WORKER.ENAME = 'SMITH' AND WORKER.MGR = MANAGER.EMPNO;
        -- ex . 모든 사원의 사번, 이름, 상사사번, 상사이름 (13행-KING의 MGR이 NULL이라서 KING 출력안됨)
SELECT W.EMPNO 사번, W.ENAME 이름 , W.MGR 상사사번 , M.ENAME 상사이름 
    FROM EMP W, EMP M
        WHERE W.MGR = M.EMPNO;
        
        -- ex.  'SMITH의 상사는 FORD다'; 포맷으로 사원들을 출력
SELECT W.ENAME|| '의 상사는 ' || M.ENAME || '다'
    FROM EMP W, EMP M
        WHERE W.MGR = M.EMPNO;
        
        -- 탄탄1. SCOTT과 동일한 부서번호에서 근무하는 사원의 이름을 출력하시오
SELECT * FROM EMP WHERE ENAME = 'SCOTT';
SELECT ENAME FROM EMP WHERE DEPTNO=20 AND ENAME != 'SCOTT';

SELECT E1.ENAME, E1.DEPTNO, E2.ENAME, E2.DEPTNO  
    FROM EMP E1,  EMP E2
       WHERE E1.ENAME = 'SCOTT' 
            AND  E1.DEPTNO = E2.DEPTNO
                AND E2.ENAME != 'SCOTT';
           

        -- 탄탄2. SCOTT과 동일한 근무지에서 근무하는 사원의 이름을 출력하시오 (2단계 최종문제)
SELECT * FROM EMP;
-- 인위적으로 DALLAS 근무지 부서를 하나 추가
INSERT INTO DEPT VALUES (50, 'IT', 'DALLAS');
SELECT * FROM DEPT;
            -- 인위적으로 50번 부서 사원 추가
SELECT * FROM EMP;     
INSERT INTO EMP VALUES (9999, '홍길동' , NULL,NULL,NULL, 9000,900,50);
 -- 2단계 정답 
SELECT E1.ENAME, D1.LOC, E2.ENAME, D2.LOC
    FROM EMP E1, DEPT D1,EMP E2, DEPT D2
        WHERE E1.DEPTNO = D1. DEPTNO
            AND E2.DEPTNO = D2.DEPTNO 
                AND D1.LOC = D2.LOC
                    AND E1.ENAME = 'SCOTT'
                        AND E2.ENAME != 'SCOTT';
ROLLBACK;  

        -- 탄탄 3. 상사의 이름이 'KING'인 사원들의 이름과 JOB을 출력
SELECT W.ENAME, W.MGR, M.EMPNO, M.ENAME
    FROM EMP W, EMP M
        WHERE W.MGR = M.EMPNO
            AND M.ENAME = 'KING';
            
            
             
------------------ ★ 4. OUTER JOIN :  조인시 조건에 만족하지 않은 행까지 나타나게   
SELECT W.EMPNO, W.ENAME, W.MGR, M.ENAME
    FROM EMP W, EMP M
        WHERE W.MGR = M.EMPNO (+);
        
SELECT ENAME, D.DEPTNO, DNAME
    FROM EMP E, DEPT D   -- 40번 부서 존재
        WHERE E.DEPTNO(+) = D.DEPTNO;  -- E.DEPTNO에는 40번 부서 없음
        
        -- 말단 사원의 이름만 출력해라
SELECT W. EMPNO, W.ENAME, W.MGR, M.ENAME
    FROM EMP W, EMP M
        WHERE W.MGR (+) = M.EMPNO AND W.EMPNO IS NULL;
        
-- ★ <연습문제> PART1
--1. 이름, 직속상사
SELECT W.ENAME, M.ENAME manager
    FROM EMP W, EMP M
        WHERE W.MGR = M.EMPNO;
--2. 이름, 급여, 업무, 직속상사
SELECT W.ENAME, W.SAL,  W.JOB, M.ENAME
    FROM EMP W, EMP M
        WHERE W.MGR = M.EMPNO;
--3. 이름, 급여, 업무, 직속상사. (상사가 없는 직원까지 전체 직원 다 출력.
    --상사가 없을 시 '없음'으로 출력)
SELECT W.ENAME, W.SAL, W.JOB, NVL(M.ENAME, '없음') manager 
    FROM EMP W, EMP M
        WHERE W.MGR = M.EMPNO(+) ;
           
                        
--4. 이름, 급여, 부서명, 직속상사명
SELECT W.ENAME, W.SAL, DNAME, M.ENAME
    FROM EMP W, DEPT D, EMP M
        WHERE W.DEPTNO = D.DEPTNO
            AND W.MGR = M.EMPNO;
--5. 이름, 급여, 부서코드, 부서명, 근무지, 직속상사명, (상사가 없는 직원까지 전체 직원 다 출력)
SELECT W.ENAME, W.SAL, W.DEPTNO, DNAME, LOC, M.ENAME
    FROM EMP W, DEPT D, EMP M
        WHERE W.DEPTNO = D.DEPTNO
            AND W.MGR = M.EMPNO(+);
--6. 이름, 급여, 등급, 부서명, 직속상사명. 급여가 2000이상인 사람
SELECT W.ENAME, W.SAL, GRADE, DNAME, M.ENAME "상사"
    FROM EMP W, DEPT D, EMP M, SALGRADE
        WHERE W.DEPTNO = D.DEPTNO
            AND W.MGR = M.EMPNO
                AND W.SAL BETWEEN LOSAL AND HISAL
                    AND W.SAL >= 2000;
--7. 이름, 급여, 등급, 부서명, 직속상사명, (직속상사가 없는 직원까지 전체직원 부서명 순 정렬)
SELECT W.ENAME, W.SAL, GRADE , DNAME , M.ENAME "상사"
    FROM EMP W, DEPT D, EMP M , SALGRADE
        WHERE W.DEPTNO = D.DEPTNO
             AND W.SAL BETWEEN LOSAL AND HISAL
                AND W.MGR = M.EMPNO(+);
--8. 이름, 급여, 등급, 부서명, 연봉, 직속상사명. 연봉=(급여+comm)*12 단 comm이 null이면 0
SELECT W.ENAME, W.SAL, GRADE, DNAME, (W.SAL*12+NVL(W.COMM,0)) "연봉", M.ENAME MANAGER
    FROM EMP W, EMP M, SALGRADE, DEPT D
        WHERE W.DEPTNO = D.DEPTNO
          AND W.SAL BETWEEN LOSAL AND HISAL
             AND W.MGR = M.EMPNO;
--9. 8번을 부서명 순 부서가 같으면 급여가 큰 순 정렬
SELECT W.ENAME, W.SAL, GRADE, DNAME, (W.SAL*12+NVL(W.COMM,0)) "연봉", M.ENAME MANAGER
    FROM EMP W, EMP M, SALGRADE, DEPT D
        WHERE W.DEPTNO = D.DEPTNO
          AND W.SAL BETWEEN LOSAL AND HISAL
             AND W.MGR = M.EMPNO
                ORDER BY DNAME, W.SAL DESC;



--  PART2
--1.EMP 테이블에서 모든 사원에 대한 이름,부서번호,부서명을 출력하는 SELECT 문장을 작성하여라.
SELECT ENAME, E.DEPTNO, DNAME
    FROM EMP E, DEPT D
        WHERE E.DEPTNO = D.DEPTNO;
--2. EMP 테이블에서 NEW YORK에서 근무하고 있는 사원에 대하여 이름,업무,급여,부서명을 출력
SELECT ENAME, JOB, SAL, DNAME
    FROM EMP E, DEPT D
        WHERE E.DEPTNO = D.DEPTNO
            AND LOC = 'NEW YORK';
--3. EMP 테이블에서 보너스를 받는 사원에 대하여 이름,부서명,위치를 출력
SELECT E.ENAME, DNAME, LOC
    FROM EMP E, DEPT D
        WHERE E.DEPTNO = D.DEPTNO
            AND NOT E.COMM IS NULL
                AND E.COMM != 0;  
--4. EMP 테이블에서 이름 중 L자가 있는 사원에 대하여 이름,업무,부서명,위치를 출력
SELECT ENAME, JOB, DNAME, LOC
    FROM EMP E, DEPT D
        WHERE E.DEPTNO = D.DEPTNO
            AND E.ENAME LIKE '%L%';
--5. 사번, 사원명, 부서코드, 부서명을 검색하라. 사원명기준으로 오름차순정열
SELECT EMPNO, ENAME, E.DEPTNO, DNAME
    FROM EMP E, DEPT D
        WHERE E.DEPTNO = D.DEPTNO
            ORDER BY ENAME;
--6. 사번, 사원명, 급여, 부서명을 검색하라. 
    --단 급여가 2000이상인 사원에 대하여 급여를 기준으로 내림차순으로 정열하시오
SELECT EMPNO, ENAME, SAL, DNAME
    FROM EMP E, DEPT D
        WHERE E.DEPTNO = D.DEPTNO
            AND SAL >= 2000
                ORDER BY SAL DESC ;
--7. 사번, 사원명, 업무, 급여, 부서명을 검색하시오. 단 업무가 MANAGER이며 급여가 2500이상인
-- 사원에 대하여 사번을 기준으로 오름차순으로 정열하시오.
SELECT EMPNO, ENAME, JOB, SAL, DNAME
    FROM EMP E , DEPT D
        WHERE E.DEPTNO = D.DEPTNO
            AND JOB = 'MANAGER'
                AND SAL >=2500
                    ORDER BY EMPNO;
--8. 사번, 사원명, 업무, 급여, 등급을 검색하시오. 단, 급여기준 내림차순으로 정렬하시오
SELECT EMPNO, ENAME, JOB, SAL, GRADE
    FROM EMP, SALGRADE
        WHERE SAL BETWEEN LOSAL AND HISAL
            ORDER BY SAL DESC;
--9. 사원테이블에서 사원명, 사원의 상사를 검색하시오(상사가 없는 직원까지 전체)
SELECT W.ENAME "사원" , M.ENAME "상사"
    FROM EMP W, EMP M
        WHERE W.MGR = M.EMPNO(+);
            
--10. 사원명, 상사명, 상사의 상사명을 검색하시오
SELECT W.ENAME "사원" , M.ENAME "부장" , K.ENAME "이사"
    FROM EMP W, EMP M, EMP K
        WHERE W.MGR = M.EMPNO
            AND M.MGR = K.EMPNO;
--11. 위의 결과에서 상위 상사가 없는 모든 직원의 이름도 출력되도록 수정하시오
SELECT W.ENAME "사원" , M.ENAME "부장" , K.ENAME "이사"
    FROM EMP W, EMP M, EMP K
        WHERE W.MGR = M.EMPNO(+)
            AND M.MGR = K.EMPNO(+);
    
    
    
    
    
    
    
    
