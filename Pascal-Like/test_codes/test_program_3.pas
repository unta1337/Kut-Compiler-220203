/*
 * 파스칼 비슷한 언어 렉서, 파서 구현.
 *
 * 아래의 코드는 정상적인 코드.
 * 이유: 중첩된 begin-end 구문 사용 가능.
 *      두 개의 구문이 존재하면 이를 세미콜론으로 구분.
 *      아래의 경우 if-then 구문과 while-do 구문이 존재, 내부의 begin-end 구문은 while-do 안의 구문이므로 while-do에 포함됨.
 */

begin
    if a < b then c := 1;
    while d > 0 do
    begin
        e := 2 + 3 - 4
    end
end
