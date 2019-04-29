program main

    use naivemath
    use bettermath
    use dotmath

    implicit none

    real(kind=4),allocatable,dimension(:,:) :: A4,B4,C4
    real(kind=8),allocatable,dimension(:,:) :: A8,B8,C8
    real(kind=16),allocatable,dimension(:,:) :: A16,B16,C16
    integer :: i, col, row
    real :: num
    integer, dimension(1) :: seed = (/10000/)
    real(kind=16) :: start, end

    !call random_seed(put=seed)

    open(unit=1, file="./res/naive4_times.txt", status='REPLACE')
    open(unit=2, file="./res/naive8_times.txt", status='REPLACE')
    open(unit=3, file="./res/naive16_times.txt", status='REPLACE')
    open(unit=4, file="./res/better4_times.txt", status='REPLACE')
    open(unit=5, file="./res/better8_times.txt", status='REPLACE')
    open(unit=6, file="./res/better16_times.txt", status='REPLACE')
    open(unit=7, file="./res/dot4_times.txt", status='REPLACE')
    open(unit=8, file="./res/dot8_times.txt", status='REPLACE')
    open(unit=9, file="./res/dot16_times.txt", status='REPLACE')
    open(unit=10, file="./res/matmul4_times.txt", status='REPLACE')
    open(unit=11, file="./res/matmul8_times.txt", status='REPLACE')
    open(unit=12, file="./res/matmul16_times.txt", status='REPLACE')

    do i=1,12
        write(i,*) "#n time"
    end do

    i = 10
    do while(i <= 1280)

        allocate(A4(i,i))
        allocate(B4(i,i))
        allocate(C4(i,i))

        allocate(A8(i,i))
        allocate(B8(i,i))
        allocate(C8(i,i))

        allocate(A16(i,i))
        allocate(B16(i,i))
        allocate(C16(i,i))

        do col=1,i
            do row=1,i
                call random_number(num)
                A4(row,col) = num
                call random_number(num)
                A8(row,col) = num
                call random_number(num)
                A16(row,col) = num
                call random_number(num)
                B4(row,col) = num
                call random_number(num)
                B8(row,col) = num
                call random_number(num)
                B16(row,col) = num
            end do
        end do

        call cpu_time(start)
        C4 = naivmull(A4, B4)
        call cpu_time(end)
        write(1,*) i, " ", end-start

        call cpu_time(start)
        C8 = naivmull(A8, B8)
        call cpu_time(end)
        write(2,*) i, " ", end-start

        call cpu_time(start)
        C16 = naivmull(A16, B16)
        call cpu_time(end)
        write(3,*) i, " ", end-start

        call cpu_time(start)
        C4 = bettmull(A4, B4)
        call cpu_time(end)
        write(4,*) i, " ", end-start

        call cpu_time(start)
        C8 = bettmull(A8, B8)
        call cpu_time(end)
        write(5,*) i, " ", end-start

        call cpu_time(start)
        C16 = bettmull(A16, B16)
        call cpu_time(end)
        write(6,*) i, " ", end-start

        call cpu_time(start)
        C4 = dotmull(A4, B4)
        call cpu_time(end)
        write(7,*) i, " ", end-start

        call cpu_time(start)
        C8 = dotmull(A8, B8)
        call cpu_time(end)
        write(8,*) i, " ", end-start

        call cpu_time(start)
        C16 = dotmull(A16, B16)
        call cpu_time(end)
        write(9,*) i, " ", end-start

        call cpu_time(start)
        C4 = matmul(A4, B4)
        call cpu_time(end)
        write(10,*) i, " ", end-start

        call cpu_time(start)
        C8 = matmul(A8, B8)
        call cpu_time(end)
        write(11,*) i, " ", end-start

        call cpu_time(start)
        C16 = matmul(A16, B16)
        call cpu_time(end)
        write(12,*) i, " ", end-start

        if(allocated(A4)) deallocate(A4)
        if(allocated(B4)) deallocate(B4)
        if(allocated(C4)) deallocate(C4)
        if(allocated(A8)) deallocate(A8)
        if(allocated(B8)) deallocate(B8)
        if(allocated(C8)) deallocate(C8)
        if(allocated(A16)) deallocate(A16)
        if(allocated(B16)) deallocate(B16)
        if(allocated(C16)) deallocate(C16)

        i = 2*i
    end do

    do i=1,12
        close(i)
    end do

end program main