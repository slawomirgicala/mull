module bettermath

    implicit none

    public :: bettmull
    private :: bettmull4, bettmull8, bettmull16

    interface bettmull
        procedure bettmull4, bettmull8, bettmull16
    end interface

contains

    function bettmull4 (A, B) result(C)
        implicit none

        real(kind=4), intent(in), dimension(:,:) :: A, B
        real(kind=4), dimension(size(A,1),size(B,2)) :: C
        integer(kind=4) :: i, j, k

        if (size(A,2) /= size(B,1)) then
            print*,"Cannot multiply matrices of that shapes"
        end if

        C = 0

        do j=1, size(B,2)
            do k=1, size(A,2)
                do i=1, size(A,1)
                    C(i,j) = C(i,j) + A(i,k)*B(k,j)
                end do
            end do
        end do

    end function bettmull4


    function bettmull8 (A, B) result(C)
        implicit none

        real(kind=8), intent(in), dimension(:,:) :: A, B
        real(kind=8), dimension(size(A,1),size(B,2)) :: C
        integer(kind=4) :: i, j, k

        if (size(A,2) /= size(B,1)) then
            print*,"Cannot multiply matrices of that shapes"
        end if

        C = 0

        do j=1, size(B,2)
            do k=1, size(A,2)
                do i=1, size(A,1)
                    C(i,j) = C(i,j) + A(i,k)*B(k,j)
                end do
            end do
        end do

    end function bettmull8


    function bettmull16 (A, B) result(C)
        implicit none

        real(kind=16), intent(in), dimension(:,:) :: A, B
        real(kind=16), dimension(size(A,1),size(B,2)) :: C
        integer(kind=4) :: i, j, k

        if (size(A,2) /= size(B,1)) then
            print*,"Cannot multiply matrices of that shapes"
        end if

        C = 0

        do j=1, size(B,2)
            do k=1, size(A,2)
                do i=1, size(A,1)
                    C(i,j) = C(i,j) + A(i,k)*B(k,j)
                end do
            end do
        end do

    end function bettmull16


end module bettermath