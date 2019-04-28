module dotmath

    implicit none

    public :: dotmull
    private :: dotmull4, dotmull8, dotmull16

    interface dotmull
        procedure dotmull4, dotmull8, dotmull16
    end interface

contains

    function dotmull4 (A, B) result(C)
        implicit none

        real(kind=4), intent(in), dimension(:,:) :: A, B
        real(kind=4), dimension(size(A,1),size(B,2)) :: C
        integer(kind=4) :: i, j

        if (size(A,2) /= size(B,1)) then
            print*,"Cannot multiply matrices of that shapes"
        end if

        do j=1, size(B,2)
            do i=1, size(A,1)
                C(i,j) = dot_product(A(i,:), B(:,j))
            end do
        end do

    end function dotmull4


    function dotmull8 (A, B) result(C)
        implicit none

        real(kind=8), intent(in), dimension(:,:) :: A, B
        real(kind=8), dimension(size(A,1),size(B,2)) :: C
        integer(kind=4) :: i, j

        if (size(A,2) /= size(B,1)) then
            print*,"Cannot multiply matrices of that shapes"
        end if

        do j=1, size(B,2)
            do i=1, size(A,1)
                C(i,j) = dot_product(A(i,:), B(:,j))
            end do
        end do

    end function dotmull8


    function dotmull16 (A, B) result(C)
        implicit none

        real(kind=16), intent(in), dimension(:,:) :: A, B
        real(kind=16), dimension(size(A,1),size(B,2)) :: C
        integer(kind=4) :: i, j

        if (size(A,2) /= size(B,1)) then
            print*,"Cannot multiply matrices of that shapes"
        end if

        do j=1, size(B,2)
            do i=1, size(A,1)
                C(i,j) = dot_product(A(i,:), B(:,j))
            end do
        end do

    end function dotmull16


end module dotmath