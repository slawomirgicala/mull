module naivemath

    implicit none

    public :: naivmull
    private :: naivmull4, naivmull8, naivmull16

    interface naivmull
        procedure naivmull4, naivmull8, naivmull16
    end interface

contains

    function naivmull4 (A, B) result(C)
        implicit none

        real(kind=4), intent(in), dimension(:,:) :: A, B
        real(kind=4), dimension(size(A,1),size(B,2)) :: C
        integer(kind=4) :: i, j, k

        if (size(A,2) /= size(B,1)) then
            print*,"Cannot multiply matrices of that shapes"
        end if

        C = 0

        do i=1, size(A,1)
            do j=1, size(B,2)
                do k=1, size(A,2)
                    C(i,j) = C(i,j) + A(i,k)*B(k,j)
                end do
            end do
        end do

    end function naivmull4


    function naivmull8 (A, B) result(C)
        implicit none

        real(kind=8), intent(in), dimension(:,:) :: A, B
        real(kind=8), dimension(size(A,1),size(B,2)) :: C
        integer(kind=4) :: i, j, k

        if (size(A,2) /= size(B,1)) then
            print*,"Cannot multiply matrices of that shapes"
        end if

        C = 0

        do i=1, size(A,1)
            do j=1, size(B,2)
                do k=1, size(A,2)
                    C(i,j) = C(i,j) + A(i,k)*B(k,j)
                end do
            end do
        end do

    end function naivmull8


    function naivmull16 (A, B) result(C)
        implicit none

        real(kind=16), intent(in), dimension(:,:) :: A, B
        real(kind=16), dimension(size(A,1),size(B,2)) :: C
        integer(kind=4) :: i, j, k

        if (size(A,2) /= size(B,1)) then
            print*,"Cannot multiply matrices of that shapes"
        end if

        C = 0

        do i=1, size(A,1)
            do j=1, size(B,2)
                do k=1, size(A,2)
                    C(i,j) = C(i,j) + A(i,k)*B(k,j)
                end do
            end do
        end do

    end function naivmull16


end module naivemath